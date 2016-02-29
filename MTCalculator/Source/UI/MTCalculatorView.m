//
//  MTCalculatorView.m
//  MTCalculator
//
//  Created by Mark Tezza on 09.02.16.
//  Copyright © 2016 Mark Tezza. All rights reserved.
//

#import "MTCalculatorView.h"

#import "MTLoadingView.h"

static NSString * const validateSymbols[] = {@"0", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9",
                                             @".", @"*", @"/", @"+", @"-", @"="};

@interface MTCalculatorView ()
@property (nonatomic, strong) MTLoadingView *loadingView;
@property (nonatomic, assign)   BOOL    isOperatorEnter;

- (void)printDisplay;
- (void)showInfoSecondLabelWithSenderTag:(NSUInteger)tag;

@end

@implementation MTCalculatorView

#pragma mark -
#pragma mark Accessors


- (BOOL)isHiddenLoadingView {
    return self.loadingView.visible;
}

#pragma mark -
#pragma mark LoadingView

- (MTLoadingView *)newLoadingView {
    return [MTLoadingView loadingViewWithSuperview:self];
}

- (void)hideLoadingView {
    self.loadingView.visible = NO;
}

- (void)showLoadingView {
    [self bindLoadingView];
    self.loadingView.visible = YES;
}

- (void)bindLoadingView {
    if (!self.loadingView) {
        self.loadingView = [self newLoadingView];
    }
}

- (BOOL)isUserInteractionEnabled {
    return self.loadingView.visible;
}

#pragma mark -
#pragma mark Public

- (void)clearAllValues {
    self.result = 0;
    self.number = 0;
    
    self.anyResult = NO;
    self.numberEntered = NO;
    self.percentEntered = NO;
    self.isOperatorEnter = NO;
    self.indicatorOperationsView.text = @"0";
    
    [self printDisplay];
    
}

- (void)enterPointForNumber {
    if (!self.anyResult) {
        NSRange range = [self.indicatorView.text rangeOfString:@"."];
        
        if (range.location == NSNotFound) {
            self.indicatorView.text = [NSString stringWithFormat:@"%@.", self.indicatorView.text];
            self.pointEntered = YES;
        }
    }
}

- (void)enterNumber:(UIButton *)sender {
    if (self.isAnyResult) {
        self.number = self.result;
        self.result = 0;
        self.anyResult = NO;
        self.result = (self.result * 10.f) + sender.tag;
    }
    else if (self.pointEntered && !self.isAnyResult) {
        [self enterPointToNumbers:sender];
    }
    else {
        self.result = (self.result * 10.f) + sender.tag;
    }
    
    [self printDisplay];
    [self showInfoSecondLabelWithSenderTag:sender.tag];
}

- (void)enterPointToNumbers:(UIButton *)sender {
    self.numberPoint = self.result;
    self.result = self.numberPoint + sender.tag * 0.1;
    self.pointEntered = NO;
}

- (void)selectionOperators:(UIButton *)sender {
    if (self.numberEntered && !self.anyResult && !self.isPercentEntered) {
        switch (self.operators) {
            case MTOperatorsMultiply:
                self.result = self.number * self.result;
                break;
                
            case MTOperatorsDivide:
                self.result = self.number / self.result;
                break;
                
            case MTOperatorsPlus:
                self.result = self.number + self.result;
                break;
                
            case MTOperatorsMinus:
                self.result = self.number - self.result;
                break;
 
            default:
                break;
        }
    } else if (self.isPercentEntered){
        [self calculatePercentage];
    }
    
    self.number = self.result;
    self.anyResult = YES;
    self.numberEntered = YES;
    
    self.operators = sender.tag;
    
    [self printDisplay];
    [self showInfoSecondLabelWithSenderTag:sender.tag];
}

- (void)calculatePercentage {
    self.result = self.number * self.result / 100.f;
    self.percentEntered = NO;
}

- (void)changeSign {
    self.result = - self.result;
    [self printDisplay];
}

#pragma mark -
#pragma mark Private

- (void)showInfoSecondLabelWithSenderTag:(NSUInteger)tag {
    UILabel *indicator = self.indicatorOperationsView;
    
    if (!self.isOperatorEnter) {
        indicator.text = @"";
    }
    
    tag == 15
    ? (indicator.text = [NSString stringWithFormat:@"%@=%.20g ",indicator.text, self.result])
    : (indicator.text = [NSString stringWithFormat:@"%@%@",indicator.text, [NSString stringWithString:validateSymbols[tag]]]);
    
    self.isOperatorEnter = YES;
    /*
     if (tag == 15) {
     indicator.text = [NSString stringWithFormat:@"%@=%g ",indicator.text, self.result];
     } else {
     NSString *str = [NSString stringWithString:validateSymbols[tag]];
     
     indicator.text = [NSString stringWithFormat:@"%@%@",indicator.text, str];
     self.isOperatorEnter = YES;
     }
     */
}

- (void)printDisplay {
    if (self.pointEntered) {
        self.indicatorView.text = [NSString stringWithFormat:@"%@%.20g", self.indicatorView.text, self.result];
    } else {
        self.indicatorView.text = [NSString stringWithFormat:@"%.20g", self.result];
    }
}

@end
