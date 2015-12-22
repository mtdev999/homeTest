//
//  MTStudent.h
//  Task#13_multithread
//
//  Created by Mark Tezza on 20.12.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MTStudent : NSObject
@property (nonatomic, copy)     NSString    *name;

- (instancetype)initWithName:(NSString *)name;

- (void)guessNumber:(NSUInteger)number range:(NSUInteger)range;
- (void)guessNumber:(NSUInteger)number range:(NSUInteger)range resultBlock:(void(^)(NSString *,float))resultBlock;

@end
