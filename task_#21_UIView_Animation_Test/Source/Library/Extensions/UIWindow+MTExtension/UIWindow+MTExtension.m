//
//  UIWindow+MTExtension.m
//  iOSProject
//
//  Created by Student 111 on 9/14/15.
//  Copyright (c) 2015 Mark Tezza. All rights reserved.
//

#import "UIWindow+MTExtension.h"

@implementation UIWindow (MTExtension)

+ (instancetype)window {
    return [[self alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
}

@end
