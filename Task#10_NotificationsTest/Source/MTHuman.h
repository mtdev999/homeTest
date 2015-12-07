//
//  MTHuman.h
//  Task#10_NotificationsTest
//
//  Created by Mark Tezza on 07.12.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MTHuman : NSObject
@property (nonatomic, assign)   float   averangePrice;

- (void)didChangeAveragePrice:(float)price;

@end
