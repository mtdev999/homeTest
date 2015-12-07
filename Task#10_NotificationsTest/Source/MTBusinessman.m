//
//  MTBusinessman.m
//  Task#10_NotificationsTest
//
//  Created by Mark Tezza on 07.12.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import "MTBusinessman.h"

@implementation MTBusinessman

#pragma mark -
#pragma mark Pablic

- (void)didChangeTaxLevel:(float)taxLevel {
    if (self.taxLevel < taxLevel) {
        NSLog(@"Businessman: Правительство подняло налоги");
    } else {
        NSLog(@"Businessman: Правительство снизело налоговую нагрузку");
    }
}


@end
