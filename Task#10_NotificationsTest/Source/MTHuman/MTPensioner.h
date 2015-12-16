//
//  MTPensioner.h
//  Task#10_NotificationsTest
//
//  Created by Mark Tezza on 07.12.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MTSetValueForCitizen.h"

@interface MTPensioner : MTSetValueForCitizen
@property (nonatomic, assign)   float    pension;

- (void)changedPensionWithObject:(id)object;

@end
