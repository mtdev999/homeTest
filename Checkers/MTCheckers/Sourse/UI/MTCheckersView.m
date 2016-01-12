//
//  MTCheckersView.m
//  MTCheckers
//
//  Created by Mark Tezza on 09.01.16.
//  Copyright © 2016 Mark Tezza. All rights reserved.
//

#import "MTCheckersView.h"
#import "MTCheckers.h"
#import "MTCellsOfDesk.h"

@interface MTCheckersView ()
@property (nonatomic, strong)   MTCheckers          *checkers;
@property (nonatomic, strong)   MTCellsOfDesk       *cell;

@property (nonatomic, strong)   NSMutableArray      *mutableCellsDesk;
@property (nonatomic, strong)   NSMutableArray      *mutableCheckers;
@property (nonatomic, strong)   NSMutableArray      *blackCheckers;
@property (nonatomic, strong)   NSMutableArray      *whiteCheckers;

@property (nonatomic, strong)   UIView              *cellsView;
@property (nonatomic, strong)   UIView              *backSideDeskView;
@property (nonatomic, strong)   UIView              *frontSideDeskView;
@property (nonatomic, strong)   UIView              *dragginView;

@property (nonatomic, strong)   UIView              *checkerView;
@property (nonatomic, strong)   UIView              *checkerWhiteView;
@property (nonatomic, strong)   UIView              *checkerBlackView;

@property (nonatomic, assign)   CGPoint             touchOffset;
@property (nonatomic, assign)   CGPoint             startPoint;
@property (nonatomic, assign)   CGPoint             checkerPoint;

@property (nonatomic, assign, getter=isColorBlack)  BOOL    firstCellIsBlack;

@end

@implementation MTCheckersView

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
    [self createDeskWithCells];

    [self createCheckerView];
}

#pragma mark -
#pragma mark Checkers

- (void)createCheckerView {
    NSMutableArray *array = [NSMutableArray new];
    for (int i = 0; i < 3; i++) {
        [array addObjectsFromArray:[self getWhiteCheckersWithRow:i]];
        [array addObjectsFromArray:[self getBlackCheckersWithRow:i]];
    }
    self.mutableCheckers = array;
    NSLog(@"arrayBlackCheckers: %lu", self.mutableCheckers.count);
}

- (NSMutableArray *)getBlackCheckersWithRow:(NSUInteger)numberRow {
    NSMutableArray *array = [NSMutableArray new];
    UIView *view = self.cellsView;
    
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
        
        [array addObject:checker];

        self.checkerBlackView = checker;
        [self.frontSideDeskView addSubview:checker];
    }
    
    return self.blackCheckers = array;
}

- (NSMutableArray *)getWhiteCheckersWithRow:(NSUInteger)numberRow {
    NSMutableArray *array = [NSMutableArray new];
    for (int i = 0; i < 4; i++) {
        UIView *checker = [MTCheckers createCheckerWithColor:[UIColor whiteColor]];
        UIView *view = self.cellsView;
        
        checker.alpha = 0;
        [UIView animateWithDuration:1.5f
                         animations:^{
                             checker.center = CGPointMake(CGRectGetWidth(view.bounds) * 2 * i +
                                                          CGRectGetWidth(view.bounds) / 2 +
                                                          ((numberRow %2) ? CGRectGetWidth(view.bounds): 0),
                                                          CGRectGetMidY(view.bounds)*2*numberRow +
                                                          CGRectGetWidth(view.bounds) / 2);
                             checker.alpha = 1.f;
                             self.checkerPoint = checker.center;
                         }];
        [array addObject:checker];
        
        self.checkerView = checker;
        [self.frontSideDeskView addSubview:checker];
    }
    
    return self.whiteCheckers = array;
}

#pragma mark -
#pragma mark Animation

- (void)onTouchesStarted:(CGPoint)point {
    [UIView animateWithDuration:0.2
                     animations:^{
                         self.dragginView.transform = CGAffineTransformMakeScale(1.1f, 1.1f);
                         self.dragginView.alpha = 0.8f;
                     }];
    for (MTCellsOfDesk *cell in self.mutableCellsDesk) {
        BOOL result = CGRectContainsPoint(cell.frame, point);
        
        if (result) {
            cell.cellBusy = NO;
            self.cellsView = cell;
        }
    }
}

- (void)onTuochesEnded:(CGPoint)point {
    [UIView animateWithDuration:0.2
                     animations:^{
                         self.dragginView.transform = CGAffineTransformIdentity;
                         self.dragginView.alpha = 1.0f;
                     }];
    
    for (MTCellsOfDesk *cell in self.mutableCellsDesk) {
        BOOL result = CGRectContainsPoint(cell.frame, point);
        
        if (result) {
            cell.cellBusy = YES;
            self.cellsView = cell;
        }
    }
    
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
        [self onTouchesStarted:pointOnMainView];
    } else {
        self.dragginView = nil;
    }
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
    if (self.dragginView) {
        UITouch *touch = [touches anyObject];
        CGPoint pointOnMainView = [touch locationInView:self.frontSideDeskView];
        
        CGPoint correction = CGPointMake(pointOnMainView.x + self.touchOffset.x,
                                         pointOnMainView.y + self.touchOffset.y);
        
        self.dragginView.center = correction;
    }
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
    if (self.dragginView) {
        UITouch *touch = [touches anyObject];
        CGPoint pointOnMainView = [touch locationInView:self.frontSideDeskView];
        
        for (MTCellsOfDesk *cell in self.mutableCellsDesk) {
            
            BOOL result = [self containsPointInView:pointOnMainView];
                
            if (CGRectContainsPoint(cell.frame, pointOnMainView) && !result
                
                && [cell.backgroundColor isEqual:[UIColor colorWithWhite:0 alpha:0.8]]) {
                
                [UIView animateWithDuration:0.3
                                 animations:^{
                                     self.dragginView.center = cell.center;
                                     
                                     [self onTuochesEnded:pointOnMainView];
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
    CGPoint point = self.checkerPoint;
    [self onTuochesEnded:point];
}

- (BOOL)containsPointInView:(CGPoint)point {
    BOOL result = NO;
    for (MTCheckers *object in self.mutableCheckers) {
        result = CGRectContainsPoint(object.frame, point);
        if (result) {
            return result;
        }
    }
    
    return NO;
}

- (void)touchesCancelled:(nullable NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
    CGPoint point = self.checkerPoint;
    [self onTuochesEnded:point];
}

#pragma mark -
#pragma mark Layers of Desk

- (void)createDeskWithCells {
    CGRect rect = self.bounds;
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMinX(rect),
                                                            CGRectGetMidY(rect) - CGRectGetWidth(rect)/2,
                                                            CGRectGetWidth(rect),
                                                            CGRectGetWidth(rect))];
    view.backgroundColor = [UIColor orangeColor];
    view.autoresizingMask = [self masks];
    
    [self addSubview:view];
    self.backSideDeskView = view;
    
    [self fillingCellsOfDesk];
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

- (void)fillingCellsOfDesk {
    NSMutableArray *array = [NSMutableArray new];
    self.firstCellIsBlack = NO;
    for (int i = 0; i < 8; i++) {
        [array addObjectsFromArray:[self viewCellsWithNimberRow:i]];
        
        self.firstCellIsBlack = !self.firstCellIsBlack;
    }
    self.mutableCellsDesk = array;
    [self createFrontSideOfDesk];
}

- (NSMutableArray *)viewCellsWithNimberRow:(NSUInteger)number {
    NSMutableArray *array = [NSMutableArray new];
    for (int i = 0; i < 8; i++) {
    
        CGSize size = CGSizeZero;
        size.width = CGRectGetWidth(self.frame) / 8;
        size.height = CGRectGetWidth(self.frame) / 8;
        
        CGPoint point = CGPointZero;
        point.x = CGRectGetMinX(self.bounds)+ size.width*i;
        point.y = (CGRectGetMinY(self.bounds) + size.height) * number;
        
        CGRect rect = CGRectMake(point.x, point.y, size.width, size.height);
        
        UIView *viewCell = [MTCellsOfDesk createCellWithFrame:rect];
        
        [self changeColorForFirstCell:viewCell numberIteraction:i];
        
        self.cellsView = viewCell;
        
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
