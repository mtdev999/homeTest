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
    NSLog(@" - change salary = %.2f", object.govSalary);
    if (self.salary < object.govSalary) {
        NSLog(@"Doctor is happy now! Government is increased salary on %.3f percent", [self increasedValue:object]);
    } else {
        NSLog(@"Docotor feel bed! Government is lowered salary on %.3f percent", [self loweredValue:object]);
    }
}

#pragma mark -
#pragma mark Private

- (float)loweredValue:(MTGovernment *)object {
    float result = ((self.salary - object.govSalary) * 100) / self.salary;
    return result;
}

- (float)increasedValue:(MTGovernment *)object {
    float result = ((object.govSalary - self.salary) * 100) / self.salary;
    return result;
}
#pragma mark -
#pragma mark Average Price

- (void)changedAveragePrice:(MTGovernment *)object {
    NSLog(@" - change average price = %.2f", object.govAveragePrice);
    if (self.averagePrice < object.govAveragePrice) {
        NSLog(@"Doctor feel bad, average price is increased");
    } else {
        NSLog(@"Doctor is happy, average price is lowered");
    }
}

@end
