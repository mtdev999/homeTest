//
//  MTRandomValues.m
//  EMISquareHolder
//
//  Created by Marina Butovich on 9/16/15.
//  Copyright (c) 2015 Marina Butovich. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MTRandomValues.h"

NSRange MTMakeRange(NSUInteger value1, NSUInteger value2) {
    unichar minValue = MIN(value1, value2);
    unichar maxValue = MAX(value1, value2);
    //NSLog(@"\n minValue = %hu\nmaxValue = %hu", minValue, maxValue);
    
    return NSMakeRange(minValue, maxValue - minValue + 1);
}

NSUInteger MTRandomIntegerInRange(NSRange range) {
    return range.location + (NSUInteger)(arc4random_uniform((u_int32_t)(NSMaxRange(range) - range.location + 1)));
}

double MTRandomDouble() {
    return (double)arc4random()/UINT32_MAX;
}