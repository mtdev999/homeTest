//
//  MTSetValueForCitizen.h
//  Task#10_NotificationsTest
//
//  Created by Mark Tezza on 12.12.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MTAveragePrice.h"

@interface MTSetValueForCitizen : NSObject <MTAveragePrice>
@property (nonatomic, assign)   float   averagePrice;

- (float)increasedValue:(float)value objectValue:(float)value2;
- (float)loweredValue:(float)value objectValue:(float)value2;

@end
