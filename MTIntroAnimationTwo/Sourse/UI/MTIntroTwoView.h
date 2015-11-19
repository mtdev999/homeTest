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

typedef NS_ENUM(NSUInteger, MTPages) {
    MTPagesHome,
    MTPagesAbout,
    MTPagesPhoto,
    MTPagesContact
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

// pages
@property (nonatomic, strong) IBOutlet UIView   *homeView;
@property (nonatomic, strong) IBOutlet UIView   *aboutView;
@property (nonatomic, strong) IBOutlet UIView   *photoView;
@property (nonatomic, strong) IBOutlet UIView   *contactView;

// other
@property (nonatomic, strong) IBOutlet UITextView   *text;
@property (nonatomic, strong) IBOutlet UILabel      *textView;
@property (nonatomic, strong) IBOutlet UIImageView  *imageView;

@property (nonatomic, assign, getter=isCircleAnimating)  BOOL      circleAnimating;

@property (nonatomic, assign) MTAnimateDuration     duration;
@property (nonatomic, assign) MTPages               pages;

- (void)animatecircle;

@end
