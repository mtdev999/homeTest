//
//  MTHuman.h
//  MTArrayTask@1
//
//  Created by Mark Tezza on 02.11.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MTHuman : NSObject
@property (nonatomic, copy)     NSString    *name;
@property (nonatomic, assign)   float       weight;
@property (nonatomic, assign)   float       height;
@property (nonatomic, assign)   BOOL        gender;

- (instancetype)initWithName:(NSString *)name
                      weight:(float)weight
                      height:(float)height;

- (void)movingHuman;

@end
