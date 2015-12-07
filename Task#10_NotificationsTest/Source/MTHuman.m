//
//  MTHuman.m
//  Task#10_NotificationsTest
//
//  Created by Mark Tezza on 07.12.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import "MTHuman.h"

@implementation MTHuman

#pragma mark -
#pragma mark Public

- (void)didChangeAveragePrice:(float)price {
    if (self.averangePrice < price) {
        NSLog(@"all: Правительство подняло цены на товары");
    } else {
        NSLog(@"all: Правительство снизило цены на товары");
    }
}

@end
