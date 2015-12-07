//
//  MTDoctor.h
//  Task#10_NotificationsTest
//
//  Created by Mark Tezza on 07.12.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MTHuman.h"

@interface MTDoctor : MTHuman
@property (nonatomic, assign)   float   salary;

-(void)didChangeSalary:(float)salary;

@end
