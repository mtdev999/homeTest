//
//  ViewController.m
//  SortedArrayOfHumans
//
//  Created by Mark Tezza on 06.11.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import "ViewController.h"

#import "MTHuman.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MTHuman *humDel = [MTHuman new];
    humDel.delegate = self;
    
    [humDel doRun];
    [humDel doRunAfter:5.0f];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)endOfRunning {
    NSLog(@"Cycler uses a bike he is not running");
}

- (void)endOfRunningTwo:(NSString *)text {
    NSLog(@"%@", text);
}

@end
