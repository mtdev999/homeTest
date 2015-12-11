//
//  MTBusinessman.m
//  Task#10_NotificationsTest
//
//  Created by Mark Tezza on 07.12.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import "MTBusinessman.h"

#import "MTGovernment.h"

@implementation MTBusinessman

#pragma mark -
#pragma mark Observable Object 

- (void)changedTaxLevelWithObject:(MTGovernment *)object {
    if (self.taxLevel < object.govTaxLevel) {
        NSLog(@"Businessman is fill very bad");
    } else {
        NSLog(@"Bussinessman is happy now!!!!!");
    }
}

@end
