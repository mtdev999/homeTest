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

+ (UIView *)createCheckerWithColor:(UIColor *)color {
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

#pragma mark -
#pragma mark Private


//- (UIView *)checker {
//    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
//    
//    view.backgroundColor = [UIColor whiteColor];
//    view.layer.borderWidth = 2.f;
//    view.layer.borderColor = [UIColor grayColor].CGColor;
//    view.layer.cornerRadius = 20.f;
//    
//    self.borderColor = (__bridge UIColor *)(view.layer.borderColor);
//    
//    return view;
//}

@end
