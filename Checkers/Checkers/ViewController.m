//
//  ViewController.m
//  Checkers
//
//  Created by Mark Tezza on 04.01.16.
//  Copyright © 2016 Mark Tezza. All rights reserved.
//

#import "ViewController.h"

#import "MTViewDeskWithCells.h"

@interface ViewController ()
@property (nonatomic, strong)   MTViewDeskWithCells *deskView;

@end

@implementation ViewController
@dynamic deskView;

#pragma mark -
#pragma mark Accessors

- (MTViewDeskWithCells *)deskView {
    if ([self isViewLoaded] && [self.view isKindOfClass:[MTViewDeskWithCells class]]) {
        return (MTViewDeskWithCells *)self.view;
    }
    
    return nil;
}


- (void)viewDidLoad {
    [super viewDidLoad];

    [self.deskView createDesk];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
