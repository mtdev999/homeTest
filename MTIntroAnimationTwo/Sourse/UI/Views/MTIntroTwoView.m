//
//  MTIntroTwoView.m
//  MTIntroAnimationTwo
//
//  Created by Mark Tezza on 16.11.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import "MTIntroTwoView.h"

#import "MTPageView.h"

@interface MTIntroTwoView ()
@property (nonatomic, strong) NSMutableArray    *circles;
@property (nonatomic, strong) MTPageView        *pageView;

@end

@implementation MTIntroTwoView
@dynamic visiblePage;

#pragma mark -
#pragma mark Accessors

- (void)setAnimatingCircles:(BOOL)animatingCircles {
    if (_animatingCircles != animatingCircles) {
        _animatingCircles = animatingCircles;

        [self animateCirclesGroup];
        [self showPageView];
    }
}

#pragma mark -
#pragma mark Public

- (void)showPageView {
    [self bindPageView];
    
}

- (MTPageView *)newPageView {
    return [MTPageView pageViewWithSuperview:self];
}

- (void)bindPageView {
    if (!self.pageView) {
        self.pageView = [self newPageView];
    } else {
       [self.pageView animationPage]; 
    }
}

- (void)animateCircle {
    [self getCircles];
    [self animatingIntroButtons];
}

#pragma mark -
#pragma mark Private

- (void)getCircles {
    NSMutableArray *circles = [NSMutableArray new];

    [circles addObject:self.circleView1];
    [circles addObject:self.circleView2];
    [circles addObject:self.circleView3];
    [circles addObject:self.circleView4];
    
    self.circles = circles;
}

#pragma mark -
#pragma mark Animating Buttons

- (void)animatingIntroButtons {
    NSMutableArray *array = self.circles;
    for (int i = 0; i < array.count; i++) {
        [self animateCircleWithObject:[array objectAtIndex:i]];
    }
}

- (void)animateCircleWithObject:(UIView *)object {
    
    [UIView animateWithDuration:[self timeDuration:[self nextValueDuration]]
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         object.transform = CGAffineTransformMakeTranslation(-430, 0);
                     }
                     completion:^(BOOL finished) {
                     }];
}

- (MTAnimateDuration)nextValueDuration {
    return (self.duration) % MTAnimateDurationCount;
}

- (float)timeDuration:(MTAnimateDuration)duration {
    float currentInterval = 0;
    switch (duration) {
        case MTAnimateDurationOne:
            currentInterval = 0.5;
            break;
            
        case MTAnimateDurationTwo:
            currentInterval = 0.6;
            break;
            
        case MTAnimateDurationThree:
            currentInterval = 0.7;
            break;
            
        case MTAnimateDurationFour:
            currentInterval = 0.9;
            
        default:
            break;
    }
    self.duration = duration + 1;
    
    return currentInterval;
}

#pragma mark -
#pragma mark Animating circles Group

- (void)animateCirclesGroup {
    if (self.animatingCircles) {
        [UIView animateWithDuration:0.6
                         animations:^{
                             [self animatingButtonsLeftAndRight];
                         }
                         completion:^(BOOL finished) {
                         }];
    } else {
        [UIView animateWithDuration:0.5
                         animations:^{
                             [self animatingButtonsLeftAndRight];
                         }
                         completion:^(BOOL finished) {
                         }];
    }
}

- (void)animatingButtonsLeftAndRight {
    NSMutableArray *array = self.circles;
    
    for (int i = 0; i < array.count; i++) {
        UIView *object = [array objectAtIndex:i];
        
        if (self.animatingCircles) {
            object.transform = CGAffineTransformMakeTranslation(-530, 0);
        } else {
            object.transform = CGAffineTransformMakeTranslation(-430, 0);
        }
    }
}


//#pragma mark -
//#pragma mark AnimatingHomeView
//
//- (void)animatingPages {
//    if (self.pages == MTPagesHome) {
//        [self animatingPagesWithPage:self.homeView];
//        
//    } else if (self.pages == MTPagesAbout) {
//        [self animatingPagesWithPage:self.aboutView];
//        
//    } else if (self.pages == MTPagesPhoto) {
//        [self animatingPagesWithPage:self.photoView];
//        
//    } else if (self.pages == MTPagesContact) {
//        [self animatingPagesWithPage:self.contactView];
//    }
//}
//
//- (void)animatingPagesWithPage:(UIView *)page {
//    
//    if (self.position == MTPositionPagesVisible || self.animatingPages != 1) {
//        for (int i = 0; i < self.pagesView.count; i++) {
//            [self animatingPageOut:page];
//        }
//    } else {
//        [self animatingPageIn:page];
//    }
//}
//
//- (void)animatingPageIn:(UIView *)page {
//    
//    [UIView animateWithDuration:0.7
//                     animations:^{
//                         page.alpha = 0;
//                         page.transform = CGAffineTransformMakeTranslation(-330, 0);
//                         page.alpha = 0.8;
//                         self.position = MTPositionPagesVisible;
//                     }];
//}
//
//- (void)animatingPageOut:(UIView *)page {
//    
//    [UIView animateWithDuration:0.7
//                     animations:^{
//                         page.transform = CGAffineTransformMakeTranslation(350, 0);
//                         page.alpha = 0;
//                         self.position = MTPositionPagesHidden;
//                     }];
//}

@end
