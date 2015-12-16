//
//  MTSetValueForCitizen.m
//  Task#10_NotificationsTest
//
//  Created by Mark Tezza on 12.12.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import "MTSetValueForCitizen.h"

#import "MTGovernment.h"

@implementation MTSetValueForCitizen
@dynamic activingApp;

#pragma mark -
#pragma mark

- (void)setActivingApp:(BOOL)activingApp {
    if (self.activingApp != activingApp) {
        self.activingApp = activingApp;
        
        [self currentStage];
    }
}

- (void)currentStage {
    
}

#pragma mark -
#pragma mark Public

- (float)loweredValue:(float)value objectValue:(float)value2; {
    float result = ((value - value2) * 100) / value;
    return result;
}

- (float)increasedValue:(float)value objectValue:(float)value2 {
    float result = ((value2 - value) * 100) / value;
    return result;
}

#pragma mark -
#pragma mark Average Price

- (void)changedAveragePrice:(MTGovernment *)object {
    NSLog(@" - change average price = %.2f", object.govAveragePrice);
}

@end
