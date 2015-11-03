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

@implementation MTTestArrayLevelPupil

#pragma mark -
#pragma mark Class Method

+ (id)performTestArrayLevelPupil {
    
    NSLog(@"Level - #Pupil#");
    
    NSMutableArray *humans = [NSMutableArray new];
    
    [humans addObject:[MTHuman human]];
    [humans addObject:[MTCycler humanCycler]];
    [humans addObject:[MTRunner humanRunner]];
    [humans addObject:[MTSwimmer humanSwimmer]];

    for (id object in humans) {
        if ([object isKindOfClass:[MTHuman class]]) {
            MTHuman *people = (MTHuman *)object;
            NSLog(@"%@", people.description);
        }
        
        [object movingHuman];
    }

    return nil;
}

@end
