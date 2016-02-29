//
//  MTLoadingView.h
//  Task#2
//
//  Created by Mark Tezza on 12.10.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MTLoadingView : UIView 
@property (nonatomic, strong) IBOutlet UIActivityIndicatorView *spinnerLoadingView;

@property (nonatomic, getter=isVisible) BOOL  visible;

+ (instancetype)loadingViewWithSuperview:(UIView *)superview;

- (void)setVisible:(BOOL)visible animated:(BOOL)animated;
- (void)setVisible:(BOOL)visible animated:(BOOL)animated completion:(void(^)(void))handler;

@end
