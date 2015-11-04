//
//  MTTestArrayLevelStar.m
//  MTArrayTask@1
//
//  Created by Mark Tezza on 04.11.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import "MTTestArrayLevelStar.h"

#import "MTHuman.h"
#import "MTCycler.h"
#import "MTRunner.h"
#import "MTSwimmer.h"
#import "MTStudent.h"

#import "MTAnimal.h"
#import "MTDog.h"
#import "MTCat.h"

@interface MTTestArrayLevelStar ()
@property (nonatomic, strong)   NSMutableArray *mutableArray;

@end

@implementation MTTestArrayLevelStar

#pragma mark -
#pragma mark Class Method

+ (void)performTestArrayLevelStar {
    MTTestArrayLevelStar *test = [MTTestArrayLevelStar new];
    
    [test sortingObjects];
}

#pragma mark -
#pragma mark

- (instancetype)init {
    self = [super init];
    if (self) {
        self.mutableArray = [NSMutableArray new];
    }
    
    return self;
}

- (void)sortingObjects {

    NSLog(@"Level - #Star#");
    
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
    
    for (NSUInteger interaction = 0; interaction < humans.count + animals.count; interaction++) {
        if (interaction < humans.count) {
            NSLog(@"%@", humans[interaction]);
        }
        if (interaction < animals.count) {
            NSLog(@"%@", animals[interaction]);
        }
    }
}

@end
