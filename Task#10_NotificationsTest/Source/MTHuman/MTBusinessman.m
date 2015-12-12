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
    float taxLevel = self.taxLevel;
    float govTaxLevel = object.govTaxLevel;
    
    NSLog(@" - change tax level = %.2f", govTaxLevel);
    if (taxLevel < govTaxLevel) {
        NSLog(@"Businessman is feel very bad! Government increased taxes on %.3f percent", [super increasedValue:taxLevel
                                                                                                     objectValue:govTaxLevel]);
    } else {
        NSLog(@"Bussinessman is happy now! Government lowered taxes on %.3f percent", [super loweredValue:taxLevel
                                                                                              objectValue:govTaxLevel]);
    }
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
