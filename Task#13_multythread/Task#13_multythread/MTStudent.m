//
//  MTStudent.m
//  Task#13_multithread
//
//  Created by Mark Tezza on 20.12.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import "MTStudent.h"

#import <UIKit/UIKit.h>

@interface MTStudent ()
@property (nonatomic, assign)   double      timer;

@end

@implementation MTStudent

#pragma mark -
#pragma mark Initializations And Deallocations

- (instancetype)initWithName:(NSString *)name {
    self = [super init];
    if (self) {
        self.name = name;
    }
    
    return self;
}

#pragma mark -
#pragma mark Public

- (void)guessNumber:(NSUInteger)number range:(NSUInteger)range {

    //dispatch_queue_t studentQueue = dispatch_queue_create("com.tezza.thread", DISPATCH_QUEUE_SERIAL);
    dispatch_queue_t studentQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(studentQueue, ^{

        NSUInteger randomNumber = arc4random() % range;
        CFTimeInterval timer = self.timer;
        timer = CACurrentMediaTime();

        while (randomNumber != number) {
            randomNumber = arc4random() % range;
        }
        
        self.timer = CACurrentMediaTime() - timer;
        
        NSLog(@"%@ performed task in %f", self.name, self.timer);
    });
}

- (void)guessNumber:(NSUInteger)number range:(NSUInteger)range resultBlock:(void(^)(NSString *,float))resultBlock {
    dispatch_queue_t studentQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(studentQueue, ^{
        
        NSUInteger randomNumber = arc4random() % range;
        CFTimeInterval timer = self.timer;
        timer = CACurrentMediaTime();
        
        while (randomNumber != number) {
            randomNumber = arc4random() % range;
        }
        
        self.timer = CACurrentMediaTime() - timer;
        dispatch_async(dispatch_get_main_queue(), ^{
            __weak MTStudent *weakSelf = self;
            resultBlock(weakSelf.name, weakSelf.timer);
        });
        
    });
}

@end
