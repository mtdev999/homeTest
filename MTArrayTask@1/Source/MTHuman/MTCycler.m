//
//  MTCycler.m
//  MTArrayTask@1
//
//  Created by Mark Tezza on 02.11.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import "MTCycler.h"

@implementation MTCycler

#pragma mark -
#pragma mark Class Method

+ (MTCycler *)humanCycler {
    return [[self alloc] initWithName:kMTCyclerName
                               weight:kMTCyclerValueWeight
                               height:kMTCyclerValueHeight];
}

#pragma mark -
#pragma mark MTHuman

- (void)movingHuman {
    NSLog(@"Cycler is moving;");
}

- (NSString *)description {
    return [NSString stringWithFormat:@"name = %@, weight = %.2f, height = %.2f",
                                        self.name,
                                        self.weight,
                                        self.height];
}



@end
