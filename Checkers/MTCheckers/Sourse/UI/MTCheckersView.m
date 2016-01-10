//
//  MTCheckersView.m
//  MTCheckers
//
//  Created by Mark Tezza on 09.01.16.
//  Copyright © 2016 Mark Tezza. All rights reserved.
//

#import "MTCheckersView.h"
#import "MTCheckers.h"

@interface MTCheckersView ()
@property (nonatomic, strong)   MTCheckers  *checkers;

@property (nonatomic, strong)   NSMutableArray      *mutableCellsDesk;
@property (nonatomic, strong)   NSMutableArray      *blackCheckers;
@property (nonatomic, strong)   NSMutableArray      *whiteCheckers;

@property (nonatomic, strong)   UIView              *backSideDeskView;
@property (nonatomic, strong)   UIView              *frontSideDeskView;
@property (nonatomic, strong)   UIView              *dragginView;
@property (nonatomic, strong)   UIView              *checkerView;
@property (nonatomic, strong)   UIView              *checkerWhiteView;
@property (nonatomic, strong)   UIView              *checkerBlackView;

@property (nonatomic, assign)   CGPoint             touchOffset;
@property (nonatomic, assign)   CGPoint             correctPoint;
@property (nonatomic, assign)   CGPoint             startPoint;

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
    
    // prepare desk with cells
    [self createBackSideOfDesk];

    [self createCheckerView];
}

#pragma mark -
#pragma mark Checkers

- (void)createCheckerView {

    for (int i = 0; i < 3; i++) {
        [self getWhiteCheckersWithRow:i];
        [self getBlackCheckersWithRow:i];
    }
    
    
}

- (void)getBlackCheckersWithRow:(NSUInteger)numberRow {
    NSMutableArray *array = [NSMutableArray new];
    UIView *view = self.cellView;
    for (int i = 0; i < 4; i++) {
        UIView *checker = [MTCheckers createCheckerWithColor:[UIColor blackColor]];
        checker.alpha = 0;
        [UIView animateWithDuration:1.5f
                         animations:^{
                             checker.center = CGPointMake(CGRectGetWidth(view.bounds) * 2 * i +
                                                          CGRectGetHeight(view.bounds) +
                                                          CGRectGetWidth(view.bounds) / 2 -
                                                          ((numberRow %2) ? CGRectGetWidth(view.bounds): 0),
                                                          CGRectGetMidY(view.bounds) +
                                                          CGRectGetHeight(view.bounds) * 5  +
                                                          CGRectGetHeight(view.bounds) * numberRow);
                             checker.alpha = 1.f;
                         }];
        
        //[self onCheckersStartedAnimation:checker withIteraction:i];
        
        [array addObject:checker];

        self.checkerBlackView = checker;
        [self.frontSideDeskView addSubview:checker];
    }
    
    self.blackCheckers = array;
}

- (void)getWhiteCheckersWithRow:(NSUInteger)numberRow {
    for (int i = 0; i < 4; i++) {
        UIView *checker = [MTCheckers createCheckerWithColor:[UIColor whiteColor]];
        UIView *view = self.cellView;
        
        checker.alpha = 0;
        [UIView animateWithDuration:1.5f
                         animations:^{
                             checker.center = CGPointMake(CGRectGetWidth(view.bounds) * 2 * i +
                                                          CGRectGetWidth(view.bounds) / 2 +
                                                          ((numberRow %2) ? CGRectGetWidth(view.bounds): 0),
                                                          CGRectGetMidY(view.bounds)*2*numberRow +
                                                          CGRectGetWidth(view.bounds) / 2);
                             checker.alpha = 1.f;
                         }];
        
        self.checkerView = checker;
        [self.frontSideDeskView addSubview:checker];
    }
}

#pragma mark -
#pragma mark Animation 

- (void)onCheckersStartedAnimation:(UIView *)checker withIteraction:(NSUInteger)number {
    
}

- (void)onTouchesStarted {
    [UIView animateWithDuration:0.2
                     animations:^{
                         self.dragginView.transform = CGAffineTransformMakeScale(1.1f, 1.1f);
                         self.dragginView.alpha = 0.8f;
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
    
    self.startPoint = pointOnMainView;
    
    if (![view isEqual:frontDeskView]) {
        self.dragginView = view;
        [frontDeskView bringSubviewToFront:view];
        
        CGPoint touchPoint = [touch locationInView:view];

        self.touchOffset = CGPointMake(CGRectGetMidX(view.bounds) - touchPoint.x,
                                       CGRectGetMidY(view.bounds) - touchPoint.y);
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
            
            if (result && [object.backgroundColor isEqual:[UIColor colorWithWhite:0 alpha:0.8]]) {

                [UIView animateWithDuration:0.3
                                 animations:^{
                                     self.dragginView.center = object.center;
                                     [self onTuochesEnded];
                                 }];
            } else {
                [UIView animateWithDuration:0.3
                                 animations:^{
                                     CGPoint correction = CGPointMake(self.startPoint.x + self.touchOffset.x,
                                                                      self.startPoint.y + self.touchOffset.y);
                                     
                                     self.dragginView.center = correction;
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
    CGRect rect = self.bounds;
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMinX(rect),
                                                            CGRectGetMidY(rect) - CGRectGetWidth(rect)/2,
                                                            CGRectGetWidth(rect),
                                                            CGRectGetWidth(rect))];
    view.backgroundColor = [UIColor orangeColor];
    view.autoresizingMask = [self masks];
    
    [self addSubview:view];
    self.backSideDeskView = view;
    
    [self fillingDeskViewOfCells];
}

- (void)createFrontSideOfDesk {
    UIView *view = [UIView new];
    view.frame = self.backSideDeskView.bounds;
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
    [self createFrontSideOfDesk];
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
        (0 == number % 2) ? (viewCell.backgroundColor = [UIColor colorWithWhite:1 alpha:0.8])
        : (viewCell.backgroundColor = [UIColor colorWithWhite:0 alpha:0.8]);
    } else {
        (0 == number % 2) ? (viewCell.backgroundColor = [UIColor colorWithWhite:0 alpha:0.8])
        : (viewCell.backgroundColor = [UIColor colorWithWhite:1 alpha:0.8]);
    }
}

- (UIViewAutoresizing)masks {
    return UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin |
    UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
}

@end
