//
//  MTBusinessman.h
//  Task#10_NotificationsTest
//
//  Created by Mark Tezza on 07.12.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MTHuman.h"

@interface MTBusinessman : MTHuman
@property (nonatomic, assign)   float   taxLevel;

- (void)didChangeTaxLevel:(float)taxLevel;

@end
