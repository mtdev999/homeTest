//
//  MTCheckBox.h
//  MTCheckers
//
//  Created by Mark Tezza on 17.01.16.
//  Copyright © 2016 Mark Tezza. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MTCheckBox : UIView
@property (nonatomic, strong)   UIView  *checkBox;

+ (UIView *)checkBoxView:(CGRect)frame;

@end
