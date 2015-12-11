//
//  MTPensioner.h
//  Task#10_NotificationsTest
//
//  Created by Mark Tezza on 07.12.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MTPensioner : NSObject
@property (nonatomic, assign)   float    pesin;

- (void)changedPesinWithObject:(id)object;

@end
