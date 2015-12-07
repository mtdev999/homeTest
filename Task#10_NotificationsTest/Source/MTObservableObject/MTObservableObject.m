//
//  MTObservableObject.m
//  Task#10_NotificationsTest
//
//  Created by Mark Tezza on 07.12.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import "MTObservableObject.h"

@interface MTObservableObject ()
@property (nonatomic, strong) NSHashTable   *mutableObservers;

@end

@implementation MTObservableObject

- (void)dealloc {
    self.mutableObservers = nil;
}

#pragma mark -
#pragma mark Initializations and Deallocations 

- (instancetype)init {
    self = [super init];
    if (self) {
        self.mutableObservers = [NSHashTable weakObjectsHashTable];
    }
    
    return self;
}

#pragma mark -
#pragma mark Pablic

- (void)addObserver:(id)observer {
    @synchronized (self) {
        [self.mutableObservers addObject:observer];
    }
}

- (void)removeObserver:(id)observer {
    @synchronized (self) {
        [self.mutableObservers removeObject:observer];
    }
}

- (void)removeAllObservers {
    [self.mutableObservers removeAllObjects];
}

- (BOOL)isObserverContains:(id)observer {
    @synchronized (self) {
        return [self.mutableObservers containsObject:observer];
    }
}

- (void)notifyObserversWithSelector:(SEL)selector {
    [self notifyObserversWithSelector:selector object:nil];
}

- (void)notifyObserversWithSelector:(SEL)selector object:(id)object {
    [self notifyObserversWithSelector:selector object:object object:nil];
}

- (void)notifyObserversWithSelector:(SEL)selector object:(id)object object:(id)object2  {
    @synchronized (self.mutableObservers) {
        for (id observer in self.mutableObservers) {
            if ([observer respondsToSelector:selector]) {
//    NSLog(@"object %@ send for observer %@ notify: '%@'", object, observer, NSStringFromSelector(selector));
                [observer performSelector:selector];
            }
        }
    }
}

@end
