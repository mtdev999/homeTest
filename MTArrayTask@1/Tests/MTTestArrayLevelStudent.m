//
//  MTTestArrayLevelPupilLevelStudent.m
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
#import "MTStudent.h"

@implementation MTTestArrayLevelStudent

#pragma mark -
#pragma mark Class Methods

+ (void)performTestArrayLevelStudent {
    
    NSLog(@"Level - #Student#");
    
    MTHuman *people = [MTHuman new];
    
    NSMutableArray *humans = [NSMutableArray new];
    
    [humans addObject:[MTHuman human]];
    [humans addObject:[MTCycler humanCycler]];
    [humans addObject:[MTRunner humanRunner]];
    [humans addObject:[MTSwimmer humanSwimmer]];
    [humans addObject:[MTStudent humanStudent]];
    
    for (id object in [humans reverseObjectEnumerator]) {
        if ([object isKindOfClass:[MTHuman class]]) {
            MTHuman *human = (MTHuman *)object;
            NSLog(@"%@", human.description);
            
            if ([object isKindOfClass:[MTStudent class]]) {
                [people movingHuman];
            }
           
            [object movingHuman];
        }
    }
}

@end
