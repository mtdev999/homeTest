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
    
}

@end
