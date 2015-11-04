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
    
    NSMutableArray *humans = [NSMutableArray new];

    [humans addObject:[MTHuman human]];
    [humans addObject:[MTCycler humanCycler]];
    [humans addObject:[MTRunner humanRunner]];
    [humans addObject:[MTSwimmer humanSwimmer]];
    [humans addObject:[MTStudent humanStudent]];
    
    NSMutableArray *animals = [NSMutableArray new];
    
    [animals addObject:[MTAnimal animal]];
    [animals addObject:[MTDog animalDog]];
    [animals addObject:[MTCat animalCat]];
    
    [animals addObjectsFromArray:humans];

    for (id object in animals) {
        NSLog(@"\n");
        
        if ([object isKindOfClass:[MTHuman class]]) {
            NSLog(@"Type of object: Human");
            MTHuman *human = (MTHuman *)object;
            NSLog(@"%@", human.description);
            
            [object movingHuman];
        }
        
        if ([object isKindOfClass:[MTAnimal class]]) {
            NSLog(@"Type of object: Animal");
            MTAnimal *animal = (MTAnimal *)object;
            NSLog(@"%@", animal.description);
            
            [animal movingAnimal];
        }
    }

    return nil;
}

@end
