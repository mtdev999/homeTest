//
//  MTCheckers.m
//  MTCheckers
//
//  Created by Mark Tezza on 10.01.16.
//  Copyright © 2016 Mark Tezza. All rights reserved.
//

#import "MTCheckers.h"

@interface MTCheckers ()

@end

@implementation MTCheckers

#pragma mark -
#pragma mark Class Methods

+ (UIView *)checkerWithColor:(UIColor *)color {
    return [[self alloc] initWithFrameAndColor:color];
}

#pragma mark -
#pragma mark Initializationa and Deallocations

- (instancetype)initWithFrameAndColor:(UIColor *)color {
    self = [super init];
    if (self) {
        self.frame = CGRectMake(0, 0, 40, 40);
        self.backgroundColor = color;
        self.layer.borderWidth = 2.f;
        self.layer.borderColor = [UIColor grayColor].CGColor;
        self.layer.cornerRadius = 20.f;
    }
    
    return self;
}

@end
