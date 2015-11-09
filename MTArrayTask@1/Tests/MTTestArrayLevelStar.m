//
//  MTTestArrayLevelStar.m
//  MTArrayTask@1
//
//  Created by Mark Tezza on 04.11.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

/*
 
 Уровень Звезда:
 (разобраться с тем чего Леша не объяснял! + реальная задача!)
 
 12. Поместить всех людей в один массив, а животных в другой массив (количество людей и животных должно быть разное)
 13. В одном цикле выводить сначала человека а потом животное, доставая данные поочередно из двух разных массивов, 
 если в одном из массивов объектов больше, то в конце должны выводиться только объекты этого массива (так как д
 ругих уже нет)
 
 */

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
@property (nonatomic, strong)   NSMutableArray *humans;
@property (nonatomic, strong)   NSMutableArray *animals;

@end

@implementation MTTestArrayLevelStar

#pragma mark -
#pragma mark Class Method

+ (void)performTestArrayLevelStar {
    NSLog(@"Level - #Star#");
    MTTestArrayLevelStar *test = [MTTestArrayLevelStar new];
    
    [test sortingObjects];
}

#pragma mark -
#pragma mark Initializationa and Deallocations

- (void)dealloc {
    self.humans = nil;
    self.animals = nil;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.humans = [NSMutableArray new];
        self.animals = [NSMutableArray new];
    }
    
    return self;
}

- (void)sortingObjects {
    [self addingObjects];
    
    NSUInteger humansCount = self.humans.count;
    NSUInteger animalsCount = self.animals.count;
    
    for (NSUInteger interaction = 0; interaction < humansCount + animalsCount; interaction++) {
        if (interaction < humansCount) {
            NSLog(@"%@", self.humans[interaction]);
        }
        if (interaction < animalsCount) {
            NSLog(@"%@", self.animals[interaction]);
        }
    }
}

- (void)addingObjects {
    NSMutableArray *humans = self.humans;
    
    [humans addObject:[MTHuman human]];
    [humans addObject:[MTCycler humanCycler]];
    [humans addObject:[MTRunner humanRunner]];
    [humans addObject:[MTSwimmer humanSwimmer]];
    [humans addObject:[MTStudent humanStudent]];
    self.humans = humans;
    
    NSMutableArray *animals = self.animals;
    
    [animals addObject:[MTAnimal animal]];
    [animals addObject:[MTDog animalDog]];
    [animals addObject:[MTCat animalCat]];
    self.animals = animals;
}

@end
