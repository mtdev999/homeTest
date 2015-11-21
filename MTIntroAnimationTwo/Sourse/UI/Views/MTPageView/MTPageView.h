//
//  MTPageView.h
//  MTIntroAnimationTwo
//
//  Created by Mark Tezza on 21.11.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, MTPositionPages) {
    MTPositionPagesHidden,
    MTPositionPagesVisible
};

typedef NS_ENUM(NSUInteger, MTButtonType) {
    MTButtonTypeHome,
    MTButtonTypeAbout,
    MTButtonTypePhoto,
    MTButtonTypeContact
};

@interface MTPageView : UIView
@property (nonatomic, strong) IBOutlet      UIView      *homeView;
@property (nonatomic, assign) MTPositionPages           position;
@property (nonatomic, assign) MTButtonType              buttonType;

@property (nonatomic, assign, getter=isVisibleView) BOOL visibleView;

+ (instancetype)pageViewWithSuperview:(UIView *)superview;

- (void)animationPage;

@end
