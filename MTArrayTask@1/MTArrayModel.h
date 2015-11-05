//
//  MTArrayModel.h
//  Task#2
//
//  Created by Mark Tezza on 21.09.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MTArrayModel : NSArray <NSFastEnumeration>
@property (nonatomic, readonly)     NSArray     *models;
@property (atomic, readonly)        NSUInteger  count;

- (NSUInteger)indexOfObject:(id)object;
- (void)addObject:(id)object;
- (void)removeObject:(id)object;

- (void)removeObjectAtIndex:(NSUInteger)index;
- (void)moveObjectFromIndex:(NSUInteger)indexOne
                  toAtIndex:(NSUInteger)indexTwo;

- (id)objectAtIndex:(NSUInteger)index;
- (id)objectAtIndexedSubscript:(NSUInteger)index;
- (void)setObject:(id)object atIndexedSubscript:(NSUInteger)index;

@end
