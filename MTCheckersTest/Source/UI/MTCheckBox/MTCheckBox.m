//
//  MTCheckBox.m
//  MTCheckers
//
//  Created by Mark Tezza on 17.01.16.
//  Copyright © 2016 Mark Tezza. All rights reserved.
//

#import "MTCheckBox.h"

#import "MTDeskView.h"
#import "MTCheckerView.h"
#import "MTMainView.h"

#define UIColorBlack [UIColor colorWithWhite:0 alpha:1.f]

@interface MTCheckBox ()
@property (nonatomic, strong)   MTDeskView      *deskView;
//@property (nonatomic, strong)   MTCheckerView   *checkerView;
@property (nonatomic, strong)   MTMainView      *mainView;

@property (nonatomic, strong)   NSMutableArray  *arrayCheckWhite;
@property (nonatomic, strong)   NSMutableArray  *arrayCheckBlack;

@end

@implementation MTCheckBox

#pragma mark -
#pragma mark Class Method

+ (instancetype)loadingCheckBoxWithDeskCellView:(MTMainView *)superview {
    MTCheckBox *view = [[MTCheckBox alloc] init];
    
    [view setupCheckView:view deskView:superview.deskView mainView:superview];
    
    [superview addSubview:view];
    
    return view;
}

#pragma mark -
#pragma mark Initializations adn Deallocations

- (instancetype)init {
    self = [super init];
    if (self) {
        self.mutableCheckBoxCells = [NSMutableArray new];
        self.arrayCheckWhite = [NSMutableArray new];
        self.arrayCheckBlack = [NSMutableArray new];
    }
    
    return self;
}

- (void)setupCheckView:(MTCheckBox *)checkView deskView:(MTDeskView *)view mainView:(MTMainView *)superview{
    self.deskView = view;
    self.mainView = superview;
    
    CGRect rect = view.frame;
    UIView *checkBoxView = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMinX(rect),
                                                                    CGRectGetMinY(rect),
                                                                    CGRectGetWidth(rect)/3 + 15,
                                                                    CGRectGetWidth(rect)/3 + 15)];
    checkBoxView.autoresizingMask = [self masks];
    
    [view.backDeskView addSubview:checkBoxView];
    self.checkBoxView = checkBoxView;
}

- (void)chekingPossibleMovesWithChecker:(UIView *)checker {
    NSMutableArray *array = [NSMutableArray new];
    
    BOOL checkerColor = [checker.backgroundColor isEqual:[UIColor colorWithWhite:1 alpha:1]];
    
    UIView *checkBox = self.checkBoxView;
    checkBox.center = checker.center;
    
    for (UIView *cell in self.deskView.mutableBlackCells) {
        BOOL result = CGRectContainsRect(checkBox.frame, cell.frame);
        if (result) {
            [array addObject:cell];
        }
    }
    self.mutableCheckBoxCells = array;
    
    // change color for helping to step
    for (UIView *cell in array) {
        NSUInteger indexAtObject = [array indexOfObject:cell];
        NSUInteger offsetCount = array.count/2;
        BOOL result = [self containsRectInRect:cell.frame];
        
        if (checkerColor && !result && indexAtObject >= offsetCount) {
            [self animationCheckView:cell];
            [self.arrayCheckWhite addObject:cell];
        } else if (!checkerColor && !result && indexAtObject <= offsetCount) {
            [self animationCheckView:cell];
            [self.arrayCheckBlack addObject:cell];
        } else {
             cell.backgroundColor = UIColorBlack;
        }
    }
}

- (void)animationCheckView:(UIView *)view {
    BOOL resultHelp = self.mainView.help;
    if (resultHelp) {
        [UIView animateWithDuration:0.3
                              delay:0
                            options: UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionAutoreverse
                         animations:^{
                             view.backgroundColor = [UIColor  redColor];
                         }
                         completion:^(BOOL finished) {
                             view.backgroundColor = UIColorBlack;
                         }];
    }
    

}

- (BOOL)containsRectInRect:(CGRect)rect {
    BOOL result = NO;
    MTCheckerView *checkerView = self.mainView.checkerView;
    
    NSArray *array = checkerView.arrayCheckers;
    for (MTCheckerView *checker in array) {
        result = CGRectContainsRect(rect, checker.frame);
        
        if (result) {
            return result;
        }
        
    }
    
    return NO;
}

- (UIViewAutoresizing)masks {
    return UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin |
    UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
}

@end
