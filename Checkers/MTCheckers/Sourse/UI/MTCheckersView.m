//
//  MTCheckersView.m
//  MTCheckers
//
//  Created by Mark Tezza on 09.01.16.
//  Copyright © 2016 Mark Tezza. All rights reserved.
//

#import "MTCheckersView.h"

@interface MTCheckersView ()
@property (nonatomic, strong)   NSMutableArray      *mutableCellsDesk;

@property (nonatomic, strong)   UIView              *backSideDeskView;
@property (nonatomic, strong)   UIView              *frontSideDeskView;
@property (nonatomic, strong)   UIView              *dragginView;

@property (nonatomic, assign)   CGPoint             touchOffset;
@property (nonatomic, assign)   CGPoint             correctPoint;

@property (nonatomic, assign, getter=isColorBlack)           BOOL    firstCellIsBlack;

@end

@implementation MTCheckersView

#pragma mark -
#pragma mark Initializationa and Deallocations

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.mutableCellsDesk = [NSMutableArray new];
    }
    return self;
}

#pragma mark -
#pragma mark Accessors

- (void)setFirstCellIsBlack:(BOOL)firstCellIsBlack {
    if (_firstCellIsBlack != firstCellIsBlack) {
        _firstCellIsBlack = firstCellIsBlack;
    }
}

#pragma mark -
#pragma mark Public

- (void)setupDeskWithCells {
    NSLog(@"called method");
    
    [self createBackSideOfDesk];
    [self fillingDeskViewOfCells];
    [self createFrontSideOfDesk];
    
    [self createCheckerView];
}

- (void)createCheckerView {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    view.backgroundColor = [UIColor redColor];
    view.layer.cornerRadius = 20.f;
    
    [self.frontSideDeskView addSubview:view];
    
}

#pragma mark -
#pragma mark Animation

- (void)onTouchesStarted {
    [UIView animateWithDuration:0.2
                     animations:^{
                         self.dragginView.transform = CGAffineTransformMakeScale(1.2f, 1.2f);
                         self.dragginView.alpha = 0.7f;
                     }];
}

- (void)onTuochesEnded {
    [UIView animateWithDuration:0.2
                     animations:^{
                         self.dragginView.transform = CGAffineTransformIdentity;
                         self.dragginView.alpha = 1.0f;
                     }];
    
    self.dragginView = nil;
}


#pragma mark -
#pragma mark Touches

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
    UIView *frontDeskView = self.frontSideDeskView;
    UITouch *touch = [touches anyObject];
    CGPoint pointOnMainView = [touch locationInView:frontDeskView];
    
    UIView *view = [frontDeskView hitTest:pointOnMainView withEvent:event];
    
    if (![view isEqual:self.frontSideDeskView]) {
        self.dragginView = view;
        [frontDeskView bringSubviewToFront:view];
        
        CGPoint touchPoint = [touch locationInView:self.dragginView];

        self.touchOffset = CGPointMake(CGRectGetMidX(self.dragginView.bounds) - touchPoint.x,
                                       CGRectGetMidY(self.dragginView.bounds) - touchPoint.y);
        [self onTouchesStarted];
    } else {
        self.dragginView = nil;
    }
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
    if (self.dragginView) {
        UIView *frontDeskView = self.frontSideDeskView;
        UITouch *touch = [touches anyObject];
        CGPoint pointOnMainView = [touch locationInView:frontDeskView];
        CGPoint correction = CGPointMake(pointOnMainView.x + self.touchOffset.x,
                                         pointOnMainView.y + self.touchOffset.y);
        
        self.dragginView.center = correction;

    }
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
    if (self.dragginView) {
        UITouch *touch = [touches anyObject];
        CGPoint pointOnMainView = [touch locationInView:self.frontSideDeskView];
        
        for (UIView *object in self.mutableCellsDesk) {
            BOOL result = CGRectContainsPoint(object.frame, pointOnMainView);
            
            if (result == YES) {
                [UIView animateWithDuration:0.3
                                 animations:^{
                                     self.dragginView.center = object.center;
                                 }];
            }
        }
    }
    
    [self onTuochesEnded];
}

- (void)touchesCancelled:(nullable NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
    [self onTuochesEnded];
}

#pragma mark -
#pragma mark Sides of Desk

- (void)createBackSideOfDesk {
    CGPoint point = CGPointZero;
    point.x = 0;
    point.y = CGRectGetMidY(self.bounds) - CGRectGetWidth(self.bounds)/2;
    
    CGSize size = CGSizeZero;
    size.width = CGRectGetWidth(self.frame);
    size.height = CGRectGetWidth(self.bounds);
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(point.x, point.y, size.width, size.height)];
    view.backgroundColor = [UIColor redColor];
    view.autoresizingMask = [self masks];
    
    [self addSubview:view];
    self.backSideDeskView = view;
}

- (void)createFrontSideOfDesk {
    CGPoint point = CGPointZero;
    point.x = CGRectGetMinX(self.backSideDeskView.bounds)- 1;
    point.y = CGRectGetMinY(self.backSideDeskView.bounds) - 1;
    
    CGSize size = CGSizeZero;
    size.width = CGRectGetWidth(self.backSideDeskView.frame) + 1;
    size.height = CGRectGetHeight(self.backSideDeskView.frame) + 1;
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(point.x, point.y, size.width, size.height)];
    view.backgroundColor = [UIColor clearColor];
    view.layer.borderWidth = 2.f;
    view.layer.borderColor = [UIColor grayColor].CGColor;
    view.autoresizingMask = [self masks];
    
    [self.backSideDeskView addSubview:view];
    self.frontSideDeskView = view;
}

#pragma mark -
#pragma mark Cells for Desk

- (void)fillingDeskViewOfCells {
    CGPoint correction = self.correctPoint;
    correction = CGPointMake(CGRectGetMinX(self.backSideDeskView.bounds),
                             CGRectGetMinY(self.backSideDeskView.bounds));
    
    self.firstCellIsBlack = NO;
    
    NSMutableArray *array = [NSMutableArray new];
    
    for (int i = 1; i <= 8; i++) {
        [array addObjectsFromArray:[self viewCells]];
        
        correction.x = CGRectGetMinX(self.backSideDeskView.bounds);
        correction.y = CGRectGetMinY(self.backSideDeskView.bounds) + CGRectGetHeight(self.cellView.frame);
        
        self.correctPoint = CGPointMake(correction.x, correction.y*i);
        
        self.firstCellIsBlack = !self.firstCellIsBlack;
    }
    
    self.mutableCellsDesk = array;
}

- (NSMutableArray *)viewCells {
    NSMutableArray *array = [NSMutableArray new];
    for (int i = 0; i < 8; i++) {
        CGPoint point = self.correctPoint;
        CGSize size = CGSizeZero;
        size.width = CGRectGetWidth(self.frame) / 8;
        size.height = CGRectGetWidth(self.frame) / 8;
        
        UIView *viewCell = [[UIView alloc] initWithFrame:CGRectMake(point.x + size.width*i, point.y,
                                                                    size.width, size.height)];
        [self changeColorForFirstCell:viewCell numberIteraction:i];
        
        self.cellView = viewCell;
        [self.backSideDeskView addSubview:viewCell];
        
        [array addObject:viewCell];
    }
    
    self.mutableCellsDesk = array;
    return self.mutableCellsDesk;
}

- (void)changeColorForFirstCell:(UIView *)viewCell numberIteraction:(NSUInteger)number {
    if (self.firstCellIsBlack) {
        (0 == number % 2) ? (viewCell.backgroundColor = [UIColor whiteColor])
        : (viewCell.backgroundColor = [UIColor blackColor]);
    } else {
        (0 == number % 2) ? (viewCell.backgroundColor = [UIColor blackColor])
        : (viewCell.backgroundColor = [UIColor whiteColor]);
    }
}

- (UIViewAutoresizing)masks {
    return UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin |
    UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
}

@end
