//
//  MTArrayModel.m
//  Task#2
//
//  Created by Mark Tezza on 21.09.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import "MTArrayModel.h"


@interface MTArrayModel ()
@property (nonatomic, retain)   NSMutableArray  *mutableObjects;

@end

@implementation MTArrayModel

@dynamic count;
@dynamic models;

#pragma mark -
#pragma markInitializations and Deallocations

- (instancetype)init {
    self = [super init];
    if (self) {
        self.mutableObjects = [NSMutableArray new];
    }
    
    return self;
}
        
#pragma mark -
#pragma mark Accessors

- (NSUInteger)count {
    return self.mutableObjects.count;
}

- (NSArray *)models {
    return [self.mutableObjects copy];
}

#pragma mark -
#pragma mark Public

- (NSUInteger)indexOfObject:(id)object {
    return [self.mutableObjects indexOfObject:object];
}

- (void)addObject:(id)object {
    [self insertObject:object atIndex:self.count];
}

- (void)removeObject:(id)object {
    NSUInteger index = [self.mutableObjects indexOfObject:object];
    [self removeObjectAtIndex:index];
}

- (void)removeObjectAtIndex:(NSUInteger)index {
    [self.mutableObjects removeObjectAtIndex:index];
}

- (void)insertObject:(id)anObject atIndex:(NSUInteger)index {
    NSMutableArray *mutableObject = self.mutableObjects;
    
    if (index == self.count) {
        [mutableObject addObject:anObject];
    } else {
        [mutableObject insertObject:anObject atIndex:index];
    }
}

- (void)moveObjectFromIndex:(NSUInteger)fromIndex toAtIndex:(NSUInteger)toIndex {
    [self moveObjectAtIndex:fromIndex toIndex:toIndex];
}

- (void)moveObjectAtIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex {
    id object = [self objectAtIndex:fromIndex];
    
    [self removeObjectAtIndex:fromIndex];
    [self insertObject:object atIndex:toIndex];
}

- (id)objectAtIndex:(NSUInteger)index {
    return self.mutableObjects[index];
}

- (id)objectAtIndexedSubscript:(NSUInteger)index {
    return [self objectAtIndex:index];
}

- (void)setObject:(id)object atIndexedSubscript:(NSUInteger)index {
    [self.mutableObjects setObject:object atIndexedSubscript:index];
}

#pragma mark -
#pragma mark NSFastEnumeration protocol

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state
                                  objects:(__unsafe_unretained id  [])buffer
                                    count:(NSUInteger)len
{
    return [self.mutableObjects countByEnumeratingWithState:state objects:buffer count:len];
}

@end
