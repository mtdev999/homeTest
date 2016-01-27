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
#import "MTCheckBox.h"

#define UIColorWithe [UIColor colorWithWhite:1 alpha:0.8f]
#define UIColorBlack [UIColor colorWithWhite:0 alpha:0.8f]

@interface MTCheckersView ()
@property (nonatomic, strong)   MTCheckers          *checkers;
@property (nonatomic, strong)   MTCellsOfDesk       *cell;

@property (nonatomic, strong)   NSMutableArray      *mutableCellsDesk;
@property (nonatomic, strong)   NSMutableArray      *blackCells;
@property (nonatomic, strong)   NSMutableArray      *whiteCells;

@property (nonatomic, strong)   NSMutableArray      *mutableCheckers;
@property (nonatomic, strong)   NSMutableArray      *blackCheckers;
@property (nonatomic, strong)   NSMutableArray      *whiteCheckers;

@property (nonatomic, strong)   NSMutableArray      *cellsForCheckBox;

@property (nonatomic, strong)   UIView              *cellsView;
@property (nonatomic, strong)   UIView              *backSideDeskView;
@property (nonatomic, strong)   UIView              *frontSideDeskView;
@property (nonatomic, strong)   UIView              *dragginView;

@property (nonatomic, strong)   UIView              *checkerView;
@property (nonatomic, strong)   UIView              *checkerWhiteView;
@property (nonatomic, strong)   UIView              *checkerBlackView;

@property (nonatomic, strong)   UIView              *checkBoxView;

@property (nonatomic, assign)   CGPoint             touchOffset;
@property (nonatomic, assign)   CGPoint             startPoint;
@property (nonatomic, assign)   CGPoint             checkerPoint;

@property (nonatomic, assign)   NSUInteger          indexAtCell;

@property (nonatomic, assign, getter=isColorBlack)              BOOL    firstCellIsBlack;
@property (nonatomic, assign, getter=isWhatColorOfChecker)      BOOL    whatColorOfChecker;

@end

@implementation MTCheckersView

- (void)dealloc {
    self.mutableCheckers = nil;
    self.mutableCellsDesk = nil;
    self.blackCheckers = nil;
    self.whiteCheckers = nil;
    self.checkers = nil;
    self.cell = nil;
}

#pragma mark -
#pragma mark Accessors

- (void)setFirstCellIsBlack:(BOOL)firstCellIsBlack {
    if (_firstCellIsBlack != firstCellIsBlack) {
        _firstCellIsBlack = firstCellIsBlack;
    }
}

- (void)setNewGame:(BOOL)newGame {
    if (_newGame != newGame) {
        _newGame = newGame;
        
        [self setupDeskWithCells];
    }
}

- (void)setHelp:(BOOL)help {
    if (_help != help) {
        _help = help;
        
        [self changeButtonTitle];
    }
}

- (void)changeButtonTitle {
    UIColor *color = self.help ? [UIColor orangeColor]:[UIColor darkGrayColor];

    [self.animateButton setTitleColor:color
                             forState:UIControlStateNormal];
}

#pragma mark -
#pragma mark Public

- (void)setupDeskWithCells {
    [self createDeskWithCells];
    [self createCheckerView];
    [self createCheckBoxView];
}

#pragma mark -
#pragma mark Check Box

- (void)createCheckBoxView {
    CGRect rect = self.cellsView.frame;
    UIView *checkBoxView = [MTCheckBox checkBoxView:CGRectMake(CGRectGetMinX(rect),
                                                               CGRectGetMinY(rect),
                                                               CGRectGetWidth(rect)*3,
                                                               CGRectGetWidth(rect)*3)];
    checkBoxView.backgroundColor = [UIColor clearColor];
    checkBoxView.autoresizingMask = [self masks];
    [self.backSideDeskView addSubview:checkBoxView];
    self.checkBoxView = checkBoxView;
}

- (void)chekingPossibleMovesWithChecker:(UIView *)checker {
    NSMutableArray *array = [NSMutableArray new];
    NSMutableArray *arrayCheckWhite = [NSMutableArray new];
    NSMutableArray *arrayCheckBlack = [NSMutableArray new];

    BOOL checkerColor = [checker.backgroundColor isEqual:[UIColor colorWithWhite:1 alpha:1]];

    UIView *checkBox = self.checkBoxView;
    checkBox.center = checker.center;
    
    for (MTCellsOfDesk *cell in self.blackCells) {
        BOOL result = CGRectContainsRect(checkBox.frame, cell.frame);
        if (result) {
            [array addObject:cell];
        }
        self.cellsForCheckBox = array;
    }

    for (UIView *object in array) {
        NSUInteger indexAtObject = [array indexOfObject:object];
        NSUInteger offsetCount = array.count/2;
        BOOL result = [self containsRectInRect:object.frame];
        
        if (checkerColor && !result && indexAtObject >= offsetCount) {
            [self animationCheckView:object];
            [arrayCheckWhite addObject:object];
        } else if (!checkerColor && !result && indexAtObject <= offsetCount) {
            [self animationCheckView:object];
            [arrayCheckBlack addObject:object];

        } else {
            object.backgroundColor = UIColorBlack;
        }
    }
}

- (void)animationCheckView:(UIView *)view {
    if (self.isHelp) {
        [UIView animateWithDuration:0.3
                              delay:0
                            options: UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionAutoreverse
                         animations:^{
                             view.backgroundColor = [UIColor colorWithWhite:1 alpha:0.3f];
                         }
                         completion:^(BOOL finished) {
                             view.backgroundColor = UIColorBlack;
                         }];
    }
}

#pragma mark -
#pragma mark Checkers

- (void)createCheckerView {
    NSMutableArray *array = [NSMutableArray new];
    for (int i = 0; i < 3; i++) {
        [UIView animateWithDuration:0.4
                         animations:^{
                             [array addObjectsFromArray:[self getWhiteCheckersWithRow:i]];
                             [array addObjectsFromArray:[self getBlackCheckersWithRow:i]];
                         }];
    }
    
    self.mutableCheckers = array;
}

- (NSMutableArray *)getBlackCheckersWithRow:(NSUInteger)numberRow {
    NSMutableArray *array = [NSMutableArray new];
    UIView *view = self.cellsView;
    
    for (int i = 0; i < 4; i++) {
        UIView *checker = [MTCheckers checkerWithColor:[UIColor blackColor]];
        checker.alpha = 0;
        
        [UIView animateWithDuration:0.5f
                              delay:0.5
                            options:UIViewAnimationOptionCurveEaseInOut
                         animations:^{
                             checker.center = CGPointMake(CGRectGetWidth(view.bounds) * 2 * i +
                                                          CGRectGetHeight(view.bounds) +
                                                          CGRectGetWidth(view.bounds) / 2 -
                                                          ((numberRow %2) ? CGRectGetWidth(view.bounds): 0),
                                                          CGRectGetMidY(view.bounds) +
                                                          CGRectGetHeight(view.bounds) * 5  +
                                                          CGRectGetHeight(view.bounds) * numberRow);
                             checker.alpha = 1.f;
                         }
                         completion:^(BOOL finished) {
                            
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
        UIView *checker = [MTCheckers checkerWithColor:[UIColor whiteColor]];
        UIView *view = self.cellsView;
        checker.alpha = 0;
        [UIView animateWithDuration:0.5f
                              delay:0.7
                            options:UIViewAnimationOptionCurveEaseInOut
                         animations:^{
                             checker.center = CGPointMake(CGRectGetWidth(view.bounds) * 2 * i +
                                                          CGRectGetWidth(view.bounds) / 2 +
                                                          ((numberRow %2) ? CGRectGetWidth(view.bounds): 0),
                                                          CGRectGetMidY(view.bounds)*2*numberRow +
                                                          CGRectGetWidth(view.bounds) / 2);
                             checker.alpha = 1.f;
                             self.checkerPoint = checker.center;
                         }
                         completion:^(BOOL finished) {
                             
                         }];
        
        [array addObject:checker];
        
        self.checkerView = checker;
        [self.frontSideDeskView addSubview:checker];
    }
    
    return self.whiteCheckers = array;
}

#pragma mark -
#pragma mark Animation

- (void)onTouchesStarted {
    [self chekingPossibleMovesWithChecker:self.dragginView];
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
        
        BOOL checkerColor = [self.dragginView.backgroundColor isEqual:[UIColor whiteColor]];

        for (MTCellsOfDesk *cell in self.cellsForCheckBox) {
            NSUInteger index = [self.cellsForCheckBox indexOfObject:cell];
            NSUInteger offsetCount = self.cellsForCheckBox.count/2;
            
            BOOL result = [self containsRectInRect:cell.frame];
   
            if (CGRectContainsPoint(cell.frame, pointOnMainView)
                && !result
                &&  (checkerColor ? index >= offsetCount : index <= offsetCount))
            {
                [UIView animateWithDuration:0.3
                                 animations:^{
                                     self.dragginView.center = cell.center;
                                     [self onTuochesEnded];
                                 }];
            }  else {
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
    NSMutableArray *blackArray = [NSMutableArray new];
    NSMutableArray *whiteArray = [NSMutableArray new];
    
    self.firstCellIsBlack = NO;
    for (int i = 0; i < 8; i++) {
        [array addObjectsFromArray:[self viewCellsWithNimberRow:i]];
        self.firstCellIsBlack = !self.firstCellIsBlack;
    }
    
    self.mutableCellsDesk = array;
    
    for (UIView *viewCell in array) {
        if ([viewCell.backgroundColor isEqual:UIColorBlack]) {
            [blackArray addObject:viewCell];
        } else {
            [whiteArray addObject:viewCell];
        }
    }

    self.blackCells = blackArray;
    self.whiteCells = whiteArray;
    
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

#pragma mark -
#pragma mark Private

- (void)changeColorForFirstCell:(UIView *)viewCell numberIteraction:(NSUInteger)number {
    if (self.firstCellIsBlack) {
        (0 == number % 2) ? (viewCell.backgroundColor = UIColorWithe)
                          : (viewCell.backgroundColor = UIColorBlack);
    } else {
        (0 == number % 2) ? (viewCell.backgroundColor = UIColorBlack)
                          : (viewCell.backgroundColor = UIColorWithe);
    }
    
    
}

- (UIViewAutoresizing)masks {
    return UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin |
    UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
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

- (BOOL)containsRectInRect:(CGRect)rect {
    BOOL result = NO;
    for (MTCheckers *checker in self.mutableCheckers) {
        result = CGRectContainsRect(rect, checker.frame);
        
        if (result) {
            return result;
        }
        
    }
    
    return NO;
}

@end
