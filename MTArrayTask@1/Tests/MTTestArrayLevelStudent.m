//
//  MTTestArrayLevelStudent.m
//  MTArrayTask@1
//
//  Created by Mark Tezza on 03.11.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import "MTTestArrayLevelStudent.h"

#import "MTHuman.h"
#import "MTCycler.h"
#import "MTRunner.h"
#import "MTSwimmer.h"

#import "ConstantsValue.h"

@implementation MTTestArrayLevelStudent

#pragma mark -
#pragma mark Class Methods

+ (id)performTestArrayLevelStudent {
    NSLog(@"Level - #Student#");
    NSMutableArray *humans = [NSMutableArray new];
    
    [humans addObject:[MTTestArrayLevelStudent getHuman]];
    [humans addObject:[MTTestArrayLevelStudent getCycler]];
    [humans addObject:[MTTestArrayLevelStudent getRunner]];
    [humans addObject:[MTTestArrayLevelStudent getSwimmer]];
    
    for (id object in humans) {
        if ([object isKindOfClass:[MTHuman class]]) {
            MTHuman *human = (MTHuman *)object;
            NSLog(@"name = %@, weight = %.2f, height = %.2f", human.name, human.weight, human.height);
        }
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
