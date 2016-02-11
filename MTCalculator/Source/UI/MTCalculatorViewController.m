//
//  MTCalculatorViewController.m
//  MTCalculator
//
//  Created by Mark Tezza on 09.02.16.
//  Copyright © 2016 Mark Tezza. All rights reserved.
//

#import "MTCalculatorViewController.h"

#import "MTCalculatorView.h"

@interface MTCalculatorViewController ()
@property (nonatomic, strong)   MTCalculatorView *calculatorView;

@end

@implementation MTCalculatorViewController
@dynamic calculatorView;

#pragma mark -
#pragma mark Accessors

- (MTCalculatorView *)calculatorView {
    if ([self isViewLoaded] && [self.view isKindOfClass:[MTCalculatorView class]]) {
        return (MTCalculatorView *)self.view;
    }
    
    return nil;
}

#pragma mark -
#pragma mark Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
    
}

#pragma mark -
#pragma mark Actions




- (IBAction)onClearAll:(UIButton *)sender {
    [self.calculatorView clearAllValues];
}

- (IBAction)onOperators:(UIButton *)sender {
    [self.calculatorView selectionOperators:sender];

}

- (IBAction)onNumbers:(UIButton *)sender {
    [self.calculatorView enterNumber:sender];
}

- (IBAction)onPoint:(UIButton *)sender {
    [self.calculatorView enterPointForNumber];
}

- (IBAction)onPercent:(UIButton *)sender {
    self.calculatorView.percentEntered = YES;
    [self onOperators:sender];
}

- (IBAction)onChangeSign:(UIButton *)sender {
    [self.calculatorView changeSign];
}
@end
