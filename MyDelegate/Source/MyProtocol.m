//
//  MyProtocol.m
//  MyDelegate
//
//  Created by Mark Tezza on 23.11.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import "MyProtocol.h"

@implementation MyProtocol

@synthesize delegate;

-(void)doSomething {
    SEL selector = @selector(endOfSomething);
    if (delegate && [delegate respondsToSelector:selector]) {
        [delegate performSelector:@selector(endOfSomething)];
    }
}

-(void)doSomethingAfter:(float)sec {
    [self performSelector:@selector(ShowInfoTwo) withObject:nil afterDelay:sec];
}

-(void)ShowInfoTwo {
    SEL selector = @selector(endOfSomethingTwo:);
    if (delegate && [delegate respondsToSelector:selector]) {
        [delegate performSelector:@selector(endOfSomethingTwo:) withObject:@"Something happened again"];
    }
}

@end
