//
//  UIViewController+MTExtension.m
//  iOSProject
//
//  Created by Mark Tezza on 16.09.15.
//  Copyright (c) 2015 Mark Tezza. All rights reserved.
//

#import "UIViewController+MTExtension.h"

@implementation UIViewController (MTExtension)

#pragma -
#pragma Class Methods

+ (id)viewController {
    return [[self alloc] initWithNibName:[self nibName] bundle:nil];
}

+ (NSString *)nibName {
    return nil;
}

@end
