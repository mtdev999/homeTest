//
//  MTHuman.h
//  SortedArrayOfHumans
//
//  Created by Mark Tezza on 06.11.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MTHuman : NSObject
@property (nonatomic, copy)     NSString    *name;
@property (nonatomic, assign)   float       weight;
@property (nonatomic, assign)   float       heigtht;
@property (nonatomic, assign)   BOOL        gender;

- (instancetype)initWithName:(NSString *)name
                      weight:(float)weight
                      height:(float)height;

- (void)movingHuman;

@end
