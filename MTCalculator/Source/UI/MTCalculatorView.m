//
//  MTCalculatorView.m
//  MTCalculator
//
//  Created by Mark Tezza on 09.02.16.
//  Copyright © 2016 Mark Tezza. All rights reserved.
//

#import "MTCalculatorView.h"

@interface MTCalculatorView ()


@end

@implementation MTCalculatorView

#pragma mark -
#pragma mark Public

- (void)clearAllValues {
    self.result = 0;
    self.number = 0;
    
    self.anyResult = NO;
    self.numberEntered = NO;
    self.percentEntered = NO;
    
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
}

- (void)printDisplay {
    if (self.pointEntered) {
        self.indicatorView.text = [NSString stringWithFormat:@"%@%g",self.indicatorView.text, self.result];
    } else {
        self.indicatorView.text = [NSString stringWithFormat:@"%g", self.result];
    }
}

- (void)calculatePercentage {
    self.result = self.number * self.result / 100.f;
    self.percentEntered = NO;
}

- (void)changeSign {
    self.result = - self.result;
    [self printDisplay];
}

@end
