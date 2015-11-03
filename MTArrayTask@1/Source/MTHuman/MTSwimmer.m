//
//  MTSwimmer.m
//  MTArrayTask@1
//
//  Created by Mark Tezza on 02.11.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import "MTSwimmer.h"

@implementation MTSwimmer

#pragma mark -
#pragma mark Class Method

+ (MTSwimmer *)humanSwimmer {
    return [[self alloc] initWithName:kMTSwimmerName
                               weight:kMTSwimmerValueWeight
                               height:kMTSwimmerValueHeight];
}

#pragma mark -
#pragma mark MTHuman

- (void)movingHuman {
    NSLog(@"Swimmer is moving;");
}

- (NSString *)description {
    return [NSString stringWithFormat:@"name = %@, weight = %.2f, height = %.2f",
                                        self.name,
                                        self.weight,
                                        self.height];
}

@end
