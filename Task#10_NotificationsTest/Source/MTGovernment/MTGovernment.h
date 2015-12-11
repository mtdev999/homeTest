//
//  MTGovernment.h
//  Task#10_NotificationsTest
//
//  Created by Mark Tezza on 07.12.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MTObservableObject.h"

@interface MTGovernment : MTObservableObject
@property (nonatomic, assign)   float     govTaxLevel;
@property (nonatomic, assign)   float     govSalary;
@property (nonatomic, assign)   float     govPensin;
@property (nonatomic, assign)   float     govAveragePrice;

//- (void)performChangeValueOfSalary:(float)salary;

@end
