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
#pragma mark Initializations

- (instancetype)init {
    self = [super init];
    if (self) {
        self.pension = 860.f;
    }
    
    return self;
}

#pragma mark -
#pragma mark Observable Object

- (void)changedPensionWithObject:(MTGovernment *)object {
    float pension = self.pension;
    float govPension = object.govPension;
    
    NSLog(@" - change pension = %.2f", govPension);
    if (pension < govPension) {
        NSLog(@"Pensioner is happy! Government increased pensin on %.3f percent", [super increasedValue:pension
                                                                                            objectValue:govPension]);
    } else {
        NSLog(@"Pensioner is feel bad! Government lowered pensin on %.3f percent", [super loweredValue:pension
                                                                                           objectValue:govPension]);
    }
    self.pension = govPension;
}

- (void)goingWakeUp {
    NSLog(@"Pensioner Wake Up!");
}

- (void)goingSleep {
    NSLog(@"Pensioner Go Sleep!");
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
        NSLog(@"Pensioner feel bad, average price is increased ");
    } else {
        NSLog(@"Pensioner is happy, average price is lowered ");
    }
    self.averagePrice = object.govAveragePrice;
}

@end
