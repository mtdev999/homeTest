//
//  MTCheckersViewController.m
//  MTCheckers
//
//  Created by Mark Tezza on 09.01.16.
//  Copyright © 2016 Mark Tezza. All rights reserved.
//

#import "MTCheckersViewController.h"

#import "MTCheckersView.h"

@interface MTCheckersViewController ()
@property (nonatomic, strong)   MTCheckersView  *checkersView;
@property (strong, nonatomic) IBOutlet UIButton *stopButton;

@end

@implementation MTCheckersViewController
@dynamic checkersView;

#pragma mark -
#pragma mark Accessors

- (MTCheckersView *)checkersView {
    if ([self isViewLoaded] && [self.view isKindOfClass:[MTCheckersView class]]) {
        return (MTCheckersView *)self.view;
    }
    
    return nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)onStartAction:(id)sender {
    self.checkersView.newGame = !self.checkersView.newGame;
}


- (IBAction)onStopAction:(id)sender {
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    [segue destinationViewController];
}
*/

@end
