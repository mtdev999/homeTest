//
//  MTBusinessman.h
//  Task#10_NotificationsTest
//
//  Created by Mark Tezza on 07.12.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MTSetValueForCitizen.h"

@interface MTBusinessman : MTSetValueForCitizen
@property (nonatomic, assign)   float   taxLevel;

- (void)changedTaxLevelWithObject:(id)object;

@end
