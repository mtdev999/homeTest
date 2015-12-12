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
    NSLog(@" - change pesin = %.2f", object.govPensin);
    if (self.pesin < object.govPensin) {
        NSLog(@"Pensioner is happy! Government increased pensin on %.3f percent", [self increasedValue:object]);
    } else {
        NSLog(@"Pensioner is feel bad! Government lowered pensin on %.3f percent", [self loweredValue:object]);
    }
}

#pragma mark -
#pragma mark Private

- (float)loweredValue:(MTGovernment *)object {
    float result = ((self.pesin - object.govPensin) * 100) / self.pesin;
    return result;
}

- (float)increasedValue:(MTGovernment *)object {
    float result = ((object.govPensin - self.pesin) * 100) / self.pesin;
    return result;
}

#pragma mark -
#pragma mark Average Price

- (void)changedAveragePrice:(MTGovernment *)object {
    NSLog(@" - change average price = %.2f", object.govAveragePrice);
    if (self.averagePrice < object.govAveragePrice) {
        NSLog(@"Pensioner feel bad, average price is increased ");
    } else {
        NSLog(@"Pensioner is happy, average price is lowered ");
    }
}

@end
