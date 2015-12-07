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
@property (nonatomic, assign)   float     taxLevel;
@property (nonatomic, assign)   float     salary;
@property (nonatomic, assign)   float     pensin;
@property (nonatomic, assign)   float     averagePrice;

- (void)changeSalary:(float)salary;
- (void)changeTaxLevel:(float)taxLevel;
- (void)changeAveragePrice:(float)price;
- (void)changePensin:(float)pensin;


@end
