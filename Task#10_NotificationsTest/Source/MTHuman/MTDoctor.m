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
    float govSalary = object.govSalary;
    float salary = self.salary;
    
    NSLog(@" - change salary = %.2f", govSalary);
    
    if (salary < govSalary) {
        NSLog(@"Doctor is happy now! Government is increased salary on %.3f percent", [super increasedValue:salary
                                                                                                objectValue:govSalary]);
    } else {
        NSLog(@"Docotor feel bed! Government is lowered salary on %.3f percent", [super loweredValue:salary
                                                                                         objectValue:govSalary]);
    }
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
