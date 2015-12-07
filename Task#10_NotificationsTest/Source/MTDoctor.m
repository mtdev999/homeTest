//
//  MTDoctor.m
//  Task#10_NotificationsTest
//
//  Created by Mark Tezza on 07.12.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import "MTDoctor.h"
#import "MTObservableObject.h"
#import "MTGovernment.h"

@implementation MTDoctor

#pragma mark -
#pragma mark Initializations and Deallocations 

- (void)didChangeSalary:(float)salary {
    if (self.salary < salary) {
        NSLog(@"doctor: Правительство увеличело зарплаты");
    } else {
        NSLog(@"doctor: fack government!!!!");
    }
}

@end
