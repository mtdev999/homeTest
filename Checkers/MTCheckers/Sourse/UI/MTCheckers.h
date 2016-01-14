//
//  MTCheckers.h
//  MTCheckers
//
//  Created by Mark Tezza on 10.01.16.
//  Copyright © 2016 Mark Tezza. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MTCheckers : UIView
@property (nonatomic, strong)   UIView  *checkerView;

+ (UIView *)createCheckerWithColor:(UIColor *)color;

@end
