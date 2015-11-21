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
    
    [self.introView animateCircle];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark Public

- (IBAction)homeButton:(id)sender {
    [self changeValue];
}

- (IBAction)aboutButton:(id)sender {
    [self changeValue];
}

- (IBAction)photoButton:(id)sender {
    [self changeValue];
}

- (IBAction)contactButton:(id)sender {
    [self changeValue];
}

- (void)changeValue {
    MTIntroTwoView *circleView = self.introView;
    circleView.animatingCircles = !circleView.animatingCircles;
}

@end
