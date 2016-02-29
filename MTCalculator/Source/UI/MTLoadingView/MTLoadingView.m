//
//  MTLoadingView.m
//  Task#2
//
//  Created by Mark Tezza on 12.10.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import "MTLoadingView.h"

#import "UINib+MTExtensions.h"

static NSTimeInterval const kMTDuration = 1.f;
static CGFloat const kMTOpaqueAlpha     = 0.0f;

@interface MTLoadingView ()

@end

@implementation MTLoadingView

#pragma mark -
#pragma mark Class Methods

+ (instancetype)loadingViewWithSuperview:(UIView *)superview {
    MTLoadingView *loadingView = [UINib objectWithClass:self];
    
    [superview addSubview:loadingView];
    loadingView.frame = superview.bounds;
    
    return loadingView;
}

#pragma mark -
#pragma mark Accessors

- (void)setVisible:(BOOL)visible {
    [self setVisible:visible animated:YES];
}

- (void)setVisible:(BOOL)visible animated:(BOOL)animated {
    [self setVisible:visible animated:animated completion:nil];
}

- (void)setVisible:(BOOL)visible animated:(BOOL)animated completion:(void(^)(void))handler {
    NSTimeInterval duration = animated ? kMTDuration : 0;
    [UIView animateWithDuration:duration
                     animations:^{
                         self.alpha = visible ? kMTOpaqueAlpha : 0;
                     } completion:^(BOOL finished) {
                         _visible = visible;
                         
                         if (handler) {
                             handler();
                         }
                     }];
}

@end
