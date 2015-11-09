//
//  ViewController.m
//  Task#6_types
//
//  Created by Mark Tezza on 09.11.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // create parent rect with size 100x100 in points x=100 y=100
    UIView *parentRect = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [self.view addSubview:parentRect];
    parentRect.backgroundColor = [UIColor greenColor];
    
    // create new rect(size 40x40 points (30,30)) inside parent's rect
    CGRect newRect = CGRectMake(30, 30, 40, 40);

    UIView *newView = [[UIView alloc] initWithFrame:newRect];
    [parentRect addSubview:newView];
    newView.backgroundColor = [UIColor blueColor];
    
    // create random points
    CGPoint point;
    
    for (NSUInteger index = 0 ; index < 50; index++) {
        point.x = arc4random_uniform(100) + 30;
        point.y = arc4random_uniform(100) + 30;
        
//        point.x = arc4random() % 101;
//        point.y = arc4random() % 101;
        
        point = CGPointMake(point.x, point.y);
        
        BOOL result = CGRectContainsPoint(newRect, point);
        if (result == 1) {
            NSLog(@" %lu.result = %@, x = %f y = %f" ,(unsigned long)index, result ? @"YES":@"NO", point.x, point.y);
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
