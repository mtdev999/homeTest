//
//  ViewController.m
//  MTDrawingTest
//
//  Created by Mark Tezza on 04.02.16.
//  Copyright © 2016 Mark Tezza. All rights reserved.
//

#import "ViewController.h"

#import "MTDrawingView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    [self.drawView setNeedsDisplay];
}

@end
