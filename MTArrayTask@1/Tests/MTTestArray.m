//
//  MTTestArray.m
//  MTArrayTask@1
//
//  Created by Mark Tezza on 02.11.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import "MTTestArray.h"

#import "MTHuman.h"
#import "MTCycler.h"
#import "MTRunner.h"
#import "MTSwimmer.h"

#import "ConstantsValue.h"

@interface MTTestArray ()
@property (nonatomic, strong) MTHuman *human;

+ (id)getHuman;
+ (id)getCycler;
+ (id)getRunner;
+ (id)getSwimmer;

@end

@implementation MTTestArray

#pragma mark -
#pragma mark Class Method

+ (id)performTestArray {
    NSMutableArray *humans = [NSMutableArray new];
    
    [humans addObject:[MTTestArray getHuman]];
    [humans addObject:[MTTestArray getCycler]];
    [humans addObject:[MTTestArray getRunner]];
    [humans addObject:[MTTestArray getSwimmer]];

    for (id object in humans) {
        if ([object isKindOfClass:[MTHuman class]]) {
            MTHuman *people = (MTHuman *)object;
            NSLog(@"name = %@, weight = %.2f, height = %.2f", people.name, people.weight, people.height);
        }
        
        [object movingHuman];
    }

    return nil;
}

#pragma mark -
#pragma mark Private Methods

+ (id)getHuman {
    return [[MTHuman alloc] initWithName:kMTHumanName
                                  weight:kMTHumanValueWeight
                                  height:kMTHumanValueHeight];
}

+ (id)getCycler {
    return [[MTCycler alloc] initWithName:kMTCyclerName
                                   weight:kMTCyclerValueWeight
                                   height:kMTCyclerValueHeight];
}

+ (id)getRunner {
    return [[MTRunner alloc] initWithName:kMTRunnerName
                                   weight:kMTRunnerValueWeight
                                   height:kMTRunnerValueHeight];
}

+ (id)getSwimmer {
    return [[MTSwimmer alloc] initWithName:kMTSwimmerName
                                    weight:kMTSwimmerValueWeight
                                    height:kMTSwimmerValueHeight];
}

@end
