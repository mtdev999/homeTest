//
//  MTDoctor.m
//  Task#10_NotificationsTest
//
//  Created by Mark Tezza on 07.12.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import "MTDoctor.h"

#import "MTGovernment.h"

@implementation MTDoctor

#pragma mark -
#pragma mark Observable Object 

- (void)changedSalaryWithObject:(MTGovernment *)object {
    if (self.salary < object.govSalary) {
        NSLog(@"Doctor is happy now");
    } else {
        NSLog(@"Docotor fill bed");
    }
}

@end
