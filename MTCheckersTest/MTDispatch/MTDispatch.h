//
//  MTDispatch.h
//  Task#2
//
//  Created by Mark Tezza on 28.09.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#ifndef MTDispatch_h
#define MTDispatch_h

void MTDispatchAsyncOnBackgroundThread(void(^block)(void));
void MTDispatchAsyncOnMainThread(void(^block)(void));
void MTDispatchSyncOnMainThread(void(^block)(void));

#endif /* MTDispatch_h */
