//
//  MTDeskViewController.m
//  MTCheckersTest
//
//  Created by Mark Tezza on 20.01.16.
//  Copyright © 2016 Mark Tezza. All rights reserved.
//

#import "MTMainViewController.h"

#import "MTMainView.h"

@interface MTMainViewController ()
@property (nonatomic, strong)   MTMainView  *mainView;

@end

@implementation MTMainViewController
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
#pragma mark Cycle life

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark Public

- (IBAction)onGameButton:(id)sender {
    self.mainView.newGame = !self.mainView.newGame;
}

- (IBAction)onHelpAction:(id)sender {
    self.mainView.help = !self.mainView.help;
}

@end
