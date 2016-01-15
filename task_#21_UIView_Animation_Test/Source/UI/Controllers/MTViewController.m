//
//  MTViewController.m
//  task_#21_UIView_Animation_Test
//
//  Created by Mark Tezza on 15.01.16.
//  Copyright © 2016 Mark Tezza. All rights reserved.
//

#import "MTViewController.h"

#import "MTMainView.h"

@interface MTViewController ()
@property (nonatomic, strong)   MTMainView  *mainView;

@end

@implementation MTViewController
@dynamic mainView;

#pragma mark -
#pragma mark Accessors

- (MTMainView *)mainView {
    if ([self isViewLoaded] && [self.view isKindOfClass:[MTMainView class]]) {
        return (MTMainView *)self.view;
    }
    
    return nil;
}

#pragma mark -
#pragma mark Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.mainView setupView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
