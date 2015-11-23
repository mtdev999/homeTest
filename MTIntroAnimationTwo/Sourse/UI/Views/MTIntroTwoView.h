//
//  MTIntroTwoView.h
//  MTIntroAnimationTwo
//
//  Created by Mark Tezza on 16.11.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, MTAnimateDuration) {
    MTAnimateDurationOne,
    MTAnimateDurationTwo,
    MTAnimateDurationThree,
    MTAnimateDurationFour,
    MTAnimateDurationCount
};

@interface MTIntroTwoView : UIView

// circles
@property (nonatomic, assign) MTAnimateDuration     duration;
@property (nonatomic, strong) IBOutlet UIView   *circleView1;
@property (nonatomic, strong) IBOutlet UIView   *circleView2;
@property (nonatomic, strong) IBOutlet UIView   *circleView3;
@property (nonatomic, strong) IBOutlet UIView   *circleView4;

// buttons
@property (nonatomic, strong) IBOutlet UIButton     *homeButton;
@property (nonatomic, strong) IBOutlet UIButton     *aboutButton;
@property (nonatomic, strong) IBOutlet UIButton     *photoButton;
@property (nonatomic, strong) IBOutlet UIButton     *contactButton;

@property (nonatomic, strong) IBOutlet UIImageView          *imageView;
@property (nonatomic, strong) IBOutlet UIVisualEffectView   *fxView;

@property (nonatomic, assign, getter=isAnimatingCircles)    BOOL      animatingCircles;

- (void)animateCircle;
- (void)showPageView;

@end
