//
//  MTCalculatorViewController.h
//  MTCalculator
//
//  Created by Mark Tezza on 09.02.16.
//  Copyright © 2016 Mark Tezza. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MTCalculatorViewController : UIViewController

- (IBAction)onClearAll:(UIButton *)sender;

- (IBAction)onOperators:(UIButton *)sender;
- (IBAction)onNumbers:(UIButton *)sender;
- (IBAction)onPoint:(UIButton *)sender;
- (IBAction)onPercent:(UIButton *)sender;
- (IBAction)onChangeSign:(UIButton *)sender;

@end
