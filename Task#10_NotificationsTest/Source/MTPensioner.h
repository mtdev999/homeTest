//
//  MTPensioner.h
//  Task#10_NotificationsTest
//
//  Created by Mark Tezza on 07.12.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MTHuman.h"

@interface MTPensioner : MTHuman
@property (nonatomic, assign)   float   pensin;

- (void)didChangePensin:(float)pensin;

@end
