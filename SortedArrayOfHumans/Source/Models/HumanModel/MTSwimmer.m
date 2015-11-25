//
//  MTSwimmer.m
//  SortedArrayOfHumans
//
//  Created by Mark Tezza on 09.11.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import "MTSwimmer.h"

@implementation MTSwimmer
//@dynamic maxSpeed;

#pragma mark -
#pragma mark Accessors

//- (float)maxSpeed {
//    return self.maxSpeed;
//}

- (void)movingHuman {
    NSLog(@"Swimmer is moving;");
}

#pragma mark -
#pragma mark Swimmers

- (void)swim {
    if ([self respondsToSelector:@selector(howAreYou)]) {
        NSLog(@"%@",[self howAreYou]);
    }
    NSLog(@"Protocol: Swimmer swims very fast, his speed = %f", self.maxSpeed);
}

- (NSString *)howAreYou {
    return [NSString stringWithFormat:@"Swimmer is feeling OK!"];
}

@end
