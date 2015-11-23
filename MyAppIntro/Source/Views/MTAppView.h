//
//  MTAppView.h
//  MyAppIntro
//
//  Created by Mark Tezza on 22.11.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, MTAnimateDuration) {
    MTAnimateDurationOne,
    MTAnimateDurationTwo,
    MTAnimateDurationThree,
    MTAnimateDurationCount
};

@interface MTAppView : UIView
@property (nonatomic, strong)   IBOutlet UIImageView *imageBackgroundView;
@property (nonatomic, strong)   IBOutlet UIView      *backgroundView;

@property (nonatomic, strong)   IBOutlet UIView     *startView;
@property (nonatomic, strong)   IBOutlet UIView     *setupView;
@property (nonatomic, strong)   IBOutlet UIView     *exitView;

@property (nonatomic, strong)   IBOutlet UILabel    *startLabel;
@property (nonatomic, strong)   IBOutlet UILabel    *setupLabel;
@property (nonatomic, strong)   IBOutlet UILabel    *exitLabel;

@property (nonatomic, strong)  IBOutlet UIButton    *startButton;
@property (nonatomic, strong)  IBOutlet UIButton    *setupButton;
@property (nonatomic, strong)  IBOutlet UIButton    *exitButton;

@property (nonatomic, strong)  IBOutlet UIView      *startPageView;

@property (nonatomic, assign)   MTAnimateDuration    duration;

- (void)startAnimatingManu;

@end
