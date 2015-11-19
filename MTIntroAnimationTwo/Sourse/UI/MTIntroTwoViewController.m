//
//  MTIntroTwoViewController.m
//  MTIntroAnimationTwo
//
//  Created by Mark Tezza on 16.11.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import "MTIntroTwoViewController.h"

#import "MTIntroTwoView.h"

@interface MTIntroTwoViewController ()
@property (nonatomic, strong) MTIntroTwoView *introView;

@end

@implementation MTIntroTwoViewController
@dynamic introView;

#pragma mark -
#pragma mark Getter Castom View

- (MTIntroTwoView *)introView {
    if ([self isViewLoaded] && [self.view isKindOfClass:[MTIntroTwoView class]]) {
        return (MTIntroTwoView *)self.view;
    }
    
    return nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.introView animatecircle];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark Public

- (IBAction)homeButton:(id)sender {
    MTIntroTwoView *circleView = self.introView;
    circleView.circleAnimating = !circleView.circleAnimating;
}

- (IBAction)aboutButton:(id)sender {
    MTIntroTwoView *circleView = self.introView;
    circleView.circleAnimating = !circleView.circleAnimating;
}

- (IBAction)photoButton:(id)sender {
    MTIntroTwoView *circleView = self.introView;
    circleView.circleAnimating = !circleView.circleAnimating;
}

- (IBAction)contactButton:(id)sender {
    MTIntroTwoView *circleView = self.introView;
    circleView.circleAnimating = !circleView.circleAnimating;
}

@end
