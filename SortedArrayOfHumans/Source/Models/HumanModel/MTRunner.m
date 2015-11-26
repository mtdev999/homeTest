//
//  MTRunner.m
//  SortedArrayOfHumans
//
//  Created by Mark Tezza on 09.11.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import "MTRunner.h"

@implementation MTRunner
@dynamic maxSpeed;

- (void)movingHuman {
    NSLog(@"Runner is moving;");
}

#pragma mark -
#pragma mark Runners

- (void)run {
    if ([self respondsToSelector:@selector(howAreYou)]) {
        NSLog(@"%@",[self howAreYou]);
    }
    NSLog(@"Protocol: Runner is run very fast!!!!");
}

//- (NSString *)howAreYou {
//    return [NSString stringWithFormat:@"Runner: I am is OK!"];
//}

@end
