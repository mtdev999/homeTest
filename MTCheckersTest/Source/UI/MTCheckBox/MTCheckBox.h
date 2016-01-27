//
//  MTCheckBox.h
//  MTCheckers
//
//  Created by Mark Tezza on 17.01.16.
//  Copyright © 2016 Mark Tezza. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MTDeskView;

@interface MTCheckBox : UIView
@property (nonatomic, strong)   UIView              *checkBoxView;
@property (nonatomic, strong)   NSMutableArray      *mutableCheckBoxCells;


+ (instancetype)loadingCheckBoxWithDeskCellView:(UIView *)superview;

- (void)chekingPossibleMovesWithChecker:(UIView *)checker;
@end
