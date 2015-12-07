//
//  MTPensioner.m
//  Task#10_NotificationsTest
//
//  Created by Mark Tezza on 07.12.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import "MTPensioner.h"

@implementation MTPensioner

#pragma mark -
#pragma mark Public

- (void)didChangePensin:(float)pensin {
    if (self.pensin < pensin) {
        NSLog(@"Pensin: Правительство подняло пенсии");
    } else {
        NSLog(@"Pensin: Правителсьство снизило пенсии");
    }
}

@end
