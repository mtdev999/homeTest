//
//  MTDispatch.m
//  Task#2
//
//  Created by Mark Tezza on 28.09.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MTDispatch.h"

void MTDispatchAsyncOnBackgroundThread(void(^block)(void)) {
    if (!block) {
        return;
    }
    
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_BACKGROUND, 0), block);
}

void MTDispatchAsyncOnMainThread(void(^block)(void)) {
    if (!block) {
        return;
    }
    
    dispatch_async(dispatch_get_main_queue(), block);
}

void MTDispatchSyncOnMainThread(void(^block)(void)) {
    if (!block) {
        return;
    }
    
    if ([NSThread isMainThread]) {
        block();
    } else {
        dispatch_sync(dispatch_get_main_queue(), block);
    }
}




