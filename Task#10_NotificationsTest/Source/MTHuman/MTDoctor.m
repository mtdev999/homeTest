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
#pragma mark Initializations

- (instancetype)init {
    self = [super init];
    if (self) {
        self.salary = 2000.f;
    }
    
    return self;
}

#pragma mark -
#pragma mark Observable Object 

- (void)changedSalaryWithObject:(MTGovernment *)object {
    float govSalary = object.govSalary;
    float currentSalary = self.salary;
    
    NSLog(@" - change salary = %.2f", govSalary);
    
    if (currentSalary < govSalary) {
        NSLog(@"Doctor is happy now! Government is increased salary on %.3f percent", [super increasedValue:currentSalary
                                                                                                objectValue:govSalary]);
    } else {
        NSLog(@"Docotor feel bed! Government is lowered salary on %.3f percent", [super loweredValue:currentSalary
                                                                                         objectValue:govSalary]);
    }
    self.salary = govSalary;
}

- (void)goingWakeUp {
    NSLog(@"Doctor Wake Up!");
}

- (void)goingSleep {
    NSLog(@"Doctor Go Sleep!");
}

//- (void)currentStage {
//    BOOL result = self.activingApp;
//    if (result == NO) {
//        NSLog(@"WAKE UP!!!");
//    } else {
//        NSLog(@"GO SLEEP!!!");
//    }
//}


#pragma mark -
#pragma mark Average Price

- (void)changedAveragePrice:(MTGovernment *)object {
    [super changedAveragePrice:object];
    
    if (self.averagePrice < object.govAveragePrice) {
        NSLog(@"Doctor feel bad, average price is increased");
    } else {
        NSLog(@"Doctor is happy, average price is lowered");
    }
    self.averagePrice = object.govAveragePrice;
}

@end
