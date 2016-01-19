//
//  MTSquareHolderView.m
//  UITaskOne
//
//  Created by Mark Tezza on 11.09.15.
//  Copyright (c) 2015 Mark Tezza. All rights reserved.
//

#import "MTSquareHolderView.h"
#import "MTMacros.h"

#import "UIColor+MTExtension.h"
#import "MTRamdomValues.h"

static NSString * const kMTButtonTitleStart = @"ON";
static NSString * const kMTButtonTitleStop = @"OFF";

static const NSTimeInterval kMTAnimationDurationValue = 1.0f;
static const NSTimeInterval kMTAnimationDelayValue = 0.2f;

@interface MTSquareHolderView ()
@property (nonatomic, assign, getter=isAnimationInProgress)  BOOL  animationInProgress;

@property (nonatomic, strong)   NSMutableArray  *mutableViews;

- (void)changeButtonTitle;
- (void)animateSquare;
- (MTSquarePosition)nextPosition;
- (CGRect)frameSquarePosition:(MTSquarePosition)position view:(UIView *)view;

@end

@implementation MTSquareHolderView

#pragma mark -
#pragma mark Accessors

- (void)setSquareAnimating:(BOOL)squareAnimating {
    if (_squareAnimating != squareAnimating) {
        _squareAnimating = squareAnimating;

        [self animationViews];
        [self animateSquare];
    }
}

- (void)setAnimationInProgress:(BOOL)animationInProgress {
    if (_animationInProgress != animationInProgress) {
        _animationInProgress = animationInProgress;
 
        [self changeButtonTitle];
    }
}

#pragma mark -
#pragma mark Public

- (void)setSquarePosition:(MTSquarePosition)position {
    [self setSquarePosition:position animated:NO];
}

- (void)setSquarePosition:(MTSquarePosition)position animated:(BOOL)animated {
    [self setSquarePosition:position animated:animated completionHandler:nil];
}

- (void)setSquarePosition:(MTSquarePosition)position
                 animated:(BOOL)animated
        completionHandler:(void(^)(void))handler
{
    self.animationInProgress = YES;
    
    UIView *viewOne = self.squareView;
    UIView *viewTwo = self.squareTwoView;
    UIView *viewThree = self.squareThreeView;
    UIView *viewFour = self.squareFourView;
    NSTimeInterval duration = animated ? kMTAnimationDurationValue : 0;
    
    [UIView animateWithDuration:duration
                          delay:kMTAnimationDelayValue
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         viewOne.frame = [self frameSquarePosition:position view:viewOne];
                         
                         viewTwo.frame = [self frameSquarePosition:(position + 1) % 4 view:viewTwo];
                         
                         viewThree.frame = [self frameSquarePosition:(position + 2) % 4 view:viewThree];
                         
                         viewFour.frame = [self frameSquarePosition:(position + 3) % 4 view:viewFour];
                     }
                     completion:^(BOOL finished) {
                         _squarePosition = position;
                         self.animationInProgress = NO;
                         
                         if (handler) {
                             handler();
                         }
                     }];
}

#pragma mark -
#pragma mark Private

- (void)changeButtonTitle {
    NSString *buttonTitle = self.animationInProgress ? kMTButtonTitleStart : kMTButtonTitleStop;
    
    [self.animateButton setTitle:buttonTitle
                        forState:UIControlStateNormal];
}

- (void)animateSquare {
    if (self.squareAnimating && !self.animationInProgress) {
        MTWeakify(self);
        [self setSquarePosition:[self nextPosition]
                       animated:YES
              completionHandler:^{
                  MTStrongifyAndReturnIfNil(self);
                  [self animateSquare];
              }];
    }
}

- (MTSquarePosition)nextPosition {
    return (self.squarePosition + 1) % MTSquarePositionCount;
}

- (CGRect)frameSquarePosition:(MTSquarePosition)position view:(UIView *)view {
    CGRect superview = self.superview.bounds;
    CGRect squareview = self.squareView.frame;
    CGPoint point = CGPointZero;
    
    CGFloat pointX = CGRectGetWidth(superview) - CGRectGetWidth(squareview);
    CGFloat pointY = CGRectGetHeight(superview) - CGRectGetHeight(squareview);

    view.transform = CGAffineTransformMakeRotation(M_PI);
    
    switch (position) {
        case MTSquarePositionUpperRightCorner:
            view.backgroundColor = [UIColor blueColor];
            point.x = pointX;
            break;
            
        case MTSquarePositionLowerRightCorner:
            view.backgroundColor = [UIColor redColor];
            point.x = pointX;
            point.y = pointY;
            break;
            
        case MTSquarePositionLowerLeftCorner:
            view.backgroundColor = [UIColor greenColor];
            point.y = pointY;
            break;
        
        case MTSquarePositionUpperLeftCorner:
            view.backgroundColor = [UIColor yellowColor];
            point.y = pointY - pointY;
            break;
            
        default:
            break;
    }
    view.transform = CGAffineTransformIdentity;
    squareview.origin = point;

    return squareview;
}

#pragma mark -
#pragma mark Level Student

- (void)createSomeViews {
    NSMutableArray *array = [NSMutableArray new];
    for (int i = 0; i < 4; i++) {
        CGRect frame = self.bounds;
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMinX(frame) +
                                                                CGRectGetWidth(frame) / 4,
                                                                CGRectGetMinY(frame) +
                                                                CGRectGetWidth(frame) / 4 +
                                                                CGRectGetWidth(frame) / 4 * i,
                                                                CGRectGetWidth(frame) / 4,
                                                                CGRectGetWidth(frame) / 4)];
        view.backgroundColor = [UIColor randomColor];
        [array addObject:view];
        
        [self addSubview:view];
        self.testView = view;
    }
    
    self.mutableViews = array;
}

- (void)animationViews {
    for (int i = 0; i < self.mutableViews.count; i++) {
        if (self.squareAnimating) {
            [self setViewOptions:[self optionsAnimationFromNumber:i] view:[self.mutableViews objectAtIndex:i]];
        }
    }
}

- (UIViewAnimationOptions)optionsAnimationFromNumber:(NSUInteger)number {
    return number << 16 | 1 << 3 | 1 << 4;
}

- (void)setViewOptions:(UIViewAnimationOptions)options view:(UIView *)view {
    
    [UIView animateWithDuration:2
                          delay:0
                        options:options
                     animations:^{
                         view.transform = CGAffineTransformMakeTranslation(CGRectGetWidth(self.bounds) - CGRectGetWidth(self.bounds)/2,
                                                                           CGRectGetMinY(self.bounds));
                         view.backgroundColor = [UIColor randomColor];
                         
                     }
                     completion:^(BOOL finished) {
                         
                     }];
}


@end
