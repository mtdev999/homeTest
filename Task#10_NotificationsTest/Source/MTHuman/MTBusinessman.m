//
//  MTBusinessman.m
//  Task#10_NotificationsTest
//
//  Created by Mark Tezza on 07.12.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import "MTBusinessman.h"

#import "MTGovernment.h"

static NSUInteger const kMTValuePercent = 100;

@implementation MTBusinessman

#pragma mark -
#pragma mark Observable Object 

- (void)changedTaxLevelWithObject:(MTGovernment *)object {
    NSLog(@" - change tax level = %.2f", object.govTaxLevel);
    if (self.taxLevel < object.govTaxLevel) {
        NSLog(@"Businessman is feel very bad! Government increased taxes on %.3f percent", [self increasedValue:object]);
    } else {
        NSLog(@"Bussinessman is happy now! Government lowered taxes on %.3f percent", [self loweredValue:object]);
    }
}

#pragma mark -
#pragma mark Private

- (float)loweredValue:(MTGovernment *)object {
    float result = ((self.taxLevel - object.govTaxLevel) * kMTValuePercent) / self.taxLevel;
    return result;
}

- (float)increasedValue:(MTGovernment *)object {
    float result = (object.govTaxLevel - self.taxLevel) * kMTValuePercent / self.taxLevel;
    return result;
}

#pragma mark -
#pragma mark Average Price

- (void)changedAveragePrice:(MTGovernment *)object {
    NSLog(@" - change average price = %.2f", object.govAveragePrice);
    if (self.averagePrice < object.govAveragePrice) {
        NSLog(@"Businessman feel bad, average price is increased ");
    } else {
        NSLog(@"Businessman is happy, average price is lowered ");
    }
}

@end
