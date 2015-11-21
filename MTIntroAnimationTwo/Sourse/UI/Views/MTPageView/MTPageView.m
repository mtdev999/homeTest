//
//  MTPageView.m
//  MTIntroAnimationTwo
//
//  Created by Mark Tezza on 21.11.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import "MTPageView.h"

#import "UINib+MTExtensions.h"

@implementation MTPageView

#pragma mark -
#pragma mark Class

+ (instancetype)pageViewWithSuperview:(UIView *)superview {
    MTPageView *pageView = [UINib objectWithClass:self];
    [pageView animationPage];
    [superview addSubview:pageView];
    
    return pageView;
}

#pragma mark -
#pragma mark Accessors

- (void)setVisibleView:(BOOL)visibleView {
    if (_visibleView != visibleView) {
        _visibleView = visibleView;
        NSLog(@"visible = %@", visibleView ? @"YES":@"NO");
    } 
}

- (IBAction)returnHome:(id)sender {
    [self animationPage];
}

- (void)animationPage {
    if (self.visibleView == NO) {
        [self animatingPageIn:self.homeView];
    } else {
        [self animatingPageOut:self.homeView];
    }
}

- (void)animatingPageIn:(UIView *)page {
    [UIView animateWithDuration:0.7
                     animations:^{
                         page.alpha = 0;
                         page.transform = CGAffineTransformMakeTranslation(-220, 0);
                         page.alpha = 0.8;
                         self.visibleView = YES;
                     }];
}

- (void)animatingPageOut:(UIView *)page {
    [UIView animateWithDuration:0.7
                     animations:^{
                         page.transform = CGAffineTransformMakeTranslation(350, 0);
                         page.alpha = 0;
                         self.visibleView = NO;
                     }];
}

@end
