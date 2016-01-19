//
//  MTSquareHolderViewController.m
//  UITaskOne
//
//  Created by Mark Tezza on 11.09.15.
//  Copyright (c) 2015 Mark Tezza. All rights reserved.
//

#import "MTSquareHolderViewController.h"

#import "MTSquareHolderView.h"
#import "MTMacros.h"

MTViewControllerBaseViewProperty(MTSquareHolderViewController, squareView, MTSquareHolderView);

@implementation MTSquareHolderViewController

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.squareView createSomeViews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark Public

- (IBAction)onAnimateButton:(id)sender {
    MTSquareHolderView *squareView = self.squareView;
    squareView.squareAnimating = !squareView.squareAnimating;
}

@end
