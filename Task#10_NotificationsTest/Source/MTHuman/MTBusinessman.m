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
        NSLog(@"Businessman is feel very bad! Government increased taxes on %.3f percent", [self increasedValue:object]);
    } else {
        NSLog(@"Bussinessman is happy now! Government lowered taxes on %.3f percent", [self loweredValue:object]);
    }
}

- (float)loweredValue:(MTGovernment *)object {
    float result = ((self.taxLevel - object.govTaxLevel) * 100) / self.taxLevel;
    return result;
}

- (float)increasedValue:(MTGovernment *)object {
    float result = ((object.govTaxLevel - self.taxLevel) * 100 / self.taxLevel);
    return result;
}

@end
