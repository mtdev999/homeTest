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
    circleView.animatingCircles = !circleView.animatingCircles;
    circleView.pages = MTPagesHome;
    //circleView.position = MTPositionPagesHidden;
    circleView.animatingPages = !circleView.animatingPages;
}

- (IBAction)aboutButton:(id)sender {
    MTIntroTwoView *circleView = self.introView;
    circleView.animatingCircles = !circleView.animatingCircles;
    circleView.pages = MTPagesAbout;
    //circleView.position = MTPositionPagesHidden;
    circleView.animatingPages = !circleView.animatingPages;
}

- (IBAction)photoButton:(id)sender {
    MTIntroTwoView *circleView = self.introView;
    circleView.animatingCircles = !circleView.animatingCircles;
    circleView.pages = MTPagesPhoto;
    //circleView.position = MTPositionPagesHidden;
    circleView.animatingPages = !circleView.animatingPages;
}

- (IBAction)contactButton:(id)sender {
    MTIntroTwoView *circleView = self.introView;
    circleView.animatingCircles = !circleView.animatingCircles;
    circleView.pages = MTPagesContact;
    //circleView.position = MTPositionPagesHidden;
    circleView.animatingPages = !circleView.animatingPages;
}

@end
