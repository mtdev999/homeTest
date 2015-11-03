//
//  MTTestArrayLevelPupil.m
//  MTArrayTask@1
//
//  Created by Mark Tezza on 02.11.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import "MTTestArrayLevelPupil.h"

#import "MTHuman.h"
#import "MTCycler.h"
#import "MTRunner.h"
#import "MTSwimmer.h"

#import "ConstantsValue.h"

@interface MTTestArrayLevelPupil ()

+ (id)getHuman;
+ (id)getCycler;
+ (id)getRunner;
+ (id)getSwimmer;

@end

@implementation MTTestArrayLevelPupil

#pragma mark -
#pragma mark Class Method

+ (id)performTestArrayLevelPupil {
    
    NSLog(@"Level - #Pupil#");
    
    NSMutableArray *humans = [NSMutableArray new];
    
    [humans addObject:[MTTestArrayLevelPupil getHuman]];
    [humans addObject:[MTTestArrayLevelPupil getCycler]];
    [humans addObject:[MTTestArrayLevelPupil getRunner]];
    [humans addObject:[MTTestArrayLevelPupil getSwimmer]];

    for (id object in humans) {
        if ([object isKindOfClass:[MTHuman class]]) {
            MTHuman *people = (MTHuman *)object;
            NSLog(@"%@", people.description);
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
