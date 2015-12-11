//
//  MTPensioner.m
//  Task#10_NotificationsTest
//
//  Created by Mark Tezza on 07.12.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import "MTPensioner.h"

#import "MTGovernment.h"

@implementation MTPensioner

#pragma mark -
#pragma mark Observable Object

- (void)changedPesinWithObject:(MTGovernment *)object {
    if (self.pesin < object.govPensin) {
        NSLog(@"Pensioner is happy");
    } else {
        NSLog(@"_______Pensioner is fill bad!!!");
    }
}

@end
