//
//  MTObservableObject.h
//  Task#10_NotificationsTest
//
//  Created by Mark Tezza on 07.12.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MTObservableObject : NSObject

- (void)addObserver:(id)observer;
- (void)removeObserver:(id)observer;
- (void)removeAllObservers;
- (BOOL)isObserverContains:(id)observer;

- (void)notifyObserversWithSelector:(SEL)selector;
- (void)notifyObserversWithSelector:(SEL)selector object:(id)object;
- (void)notifyObserversWithSelector:(SEL)selector object:(id)object object:(id)object2;

@end
