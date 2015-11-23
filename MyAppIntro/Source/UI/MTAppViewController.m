//
//  MTAppViewController.m
//  MyAppIntro
//
//  Created by Mark Tezza on 22.11.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import "MTAppViewController.h"

#import "MTAppView.h"

@interface MTAppViewController ()
@property (nonatomic, strong) MTAppView *appView;

@end

@implementation MTAppViewController
@dynamic appView;

#pragma mark -
#pragma mark Accessors

- (MTAppView *)appView {
    if ([self isViewLoaded] && [self.view isKindOfClass:[MTAppView class]]) {
        return (MTAppView *)self.view;
    }
    
    return nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.appView startAnimatingManu];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark -
#pragma mark

- (IBAction)startButton:(id)sender {
    
}

- (IBAction)setupButton:(id)sender {
    
}

- (IBAction)exitButton:(id)sender {
    
}

@end
