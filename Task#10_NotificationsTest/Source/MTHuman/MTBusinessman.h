//
//  MTBusinessman.h
//  Task#10_NotificationsTest
//
//  Created by Mark Tezza on 07.12.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MTAveragePrice.h"

@interface MTBusinessman : NSObject <MTAveragePrice>
@property (nonatomic, assign)   float   averagePrice;
@property (nonatomic, assign)   float   taxLevel;

- (void)changedTaxLevelWithObject:(id)object;

@end
