//
//  UIColor+MTExtension.m
//  iOSProject
//
//  Created by Mark Tezza on 12.09.15.
//  Copyright (c) 2015 Mark Tezza. All rights reserved.
//

#import "UIColor+MTExtension.h"
#include "MTRamdomValues.h"

@implementation UIColor (MTExtension)

+ (id)randomColor {
    
    CGFloat red = [UIColor getRed];;
    CGFloat green = [UIColor getGreen];
    CGFloat blue = [UIColor getBlue];

    return [UIColor colorWithRed:red green:green blue:blue alpha:1.0f];
}

+ (CGFloat)getRed {
    CGFloat red = MTRandomFloat();
    
    return red;
}

+ (CGFloat)getGreen {
    CGFloat green = MTRandomFloat();
    
    return green;
}

+ (CGFloat)getBlue {
    CGFloat blue = MTRandomFloat();
    
    return blue;
}



@end
