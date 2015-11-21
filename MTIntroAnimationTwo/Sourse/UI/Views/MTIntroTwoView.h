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

// buttons
@property (nonatomic, strong) IBOutlet UIView   *circleView1;
@property (nonatomic, strong) IBOutlet UIView   *circleView2;
@property (nonatomic, strong) IBOutlet UIView   *circleView3;
@property (nonatomic, strong) IBOutlet UIView   *circleView4;

@property (nonatomic, strong) IBOutlet UIButton     *homeButton;
@property (nonatomic, strong) IBOutlet UIButton     *aboutButton;
@property (nonatomic, strong) IBOutlet UIButton     *photoButton;
@property (nonatomic, strong) IBOutlet UIButton     *contactButton;

// other
@property (nonatomic, strong) IBOutlet UITextView   *text;
@property (nonatomic, strong) IBOutlet UILabel      *textView;
@property (nonatomic, strong) IBOutlet UIImageView  *imageView;

@property (nonatomic, assign, getter=isAnimatingCircles)    BOOL      animatingCircles;
@property (nonatomic, assign, getter=isVisiblePage)         BOOL      visiblePage;

@property (nonatomic, assign) MTAnimateDuration     duration;

- (void)animateCircle;
- (void)showPageView;

@end
