//
//  MTStudent.h
//  MTArrayTask@1
//
//  Created by Mark Tezza on 03.11.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import "MTHuman.h"

@interface MTStudent : MTHuman
@property (nonatomic, assign)   NSUInteger  age;
@property (nonatomic, copy)     NSString    *universityName;

+ (MTStudent *)humanStudent;

@end
