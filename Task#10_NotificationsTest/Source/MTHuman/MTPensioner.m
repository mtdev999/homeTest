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

- (void)changedpensionWithObject:(MTGovernment *)object {
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
