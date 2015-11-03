//
//  MTTestArrayLevelMaster.m
//  MTArrayTask@1
//
//  Created by Mark Tezza on 03.11.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import "MTTestArrayLevelMaster.h"

#import "MTHuman.h"
#import "MTCycler.h"
#import "MTRunner.h"
#import "MTSwimmer.h"
#import "MTStudent.h"

#import "MTAnimal.h"
#import "MTDog.h"
#import "MTCat.h"

@implementation MTTestArrayLevelMaster

#pragma mark -
#pragma mark Public

+ (id)performTestArrayLevelMaster {
    NSLog(@"Level - #Master#");
    
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

    
    return nil;
}

@end
