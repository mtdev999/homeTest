//
//  MTHuman.h
//  MTArrayTask@1
//
//  Created by Mark Tezza on 02.11.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ConstantsValue.h"

@interface MTHuman : NSObject
@property (nonatomic, copy)     NSString    *name;
@property (nonatomic, readonly)   float       weight;
@property (nonatomic, readonly)   float       height;
@property (nonatomic, readonly)   BOOL        gender;

+ (MTHuman *)human;

- (instancetype)initWithName:(NSString *)name
                      weight:(float)weight
                      height:(float)height;

- (void)movingHuman;

@end
