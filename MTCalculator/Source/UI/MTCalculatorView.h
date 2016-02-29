//
//  MTCalculatorView.h
//  MTCalculator
//
//  Created by Mark Tezza on 09.02.16.
//  Copyright © 2016 Mark Tezza. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, MTOperators) {
    MTOperatorsMultiply = 11,
    MTOperatorsDivide,
    MTOperatorsPlus,
    MTOperatorsMinus,
    MTOperatorsPercent,
    MTOperatorsEqually
};

@interface MTCalculatorView : UIView
@property (nonatomic, strong) IBOutlet  UILabel         *indicatorOperationsView;
@property (nonatomic, strong) IBOutlet  UILabel         *indicatorView;
@property (nonatomic, assign)           MTOperators     operators;

@property (nonatomic, assign)   double      number;
@property (nonatomic, assign)   double      result;
@property (nonatomic, assign)   double      numberPoint;

@property (nonatomic, assign,getter=isAnyResult)        BOOL    anyResult;
@property (nonatomic, assign,getter=isNumberEntered)    BOOL    numberEntered;
@property (nonatomic, assign,getter=isPointEntered)     BOOL    pointEntered;
@property (nonatomic, assign,getter=isPercentEntered)   BOOL    percentEntered;


@property (nonatomic, readonly, getter=isHiddenLoadingView) BOOL hiddenLoadingView;

- (void)hideLoadingView;
- (void)showLoadingView;

- (void)enterNumber:(UIButton *)sender;
- (void)selectionOperators:(UIButton *)sender;
- (void)showInfoSecondLabelWithSenderTag:(NSUInteger)tag;
- (void)clearAllValues;

- (void)enterPointForNumber;
- (void)calculatePercentage;
- (void)changeSign;


@end
