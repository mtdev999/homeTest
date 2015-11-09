//
//  MTTestArrayLevelMaster.m
//  MTArrayTask@1
//
//  Created by Mark Tezza on 03.11.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

/*
 
 Уровень Мастер:
 (простор для фантазии + больше мозговой деятельности + больше практики)
 
 8. Создать класс "животное" (не наследник класса человек!) со своими собственными базовыми свойствами (отличными от человеческих) и методом "передвижение".
 9. Унаследоватьcя от него и создать пару других классов с переопределенным передвижением.
 10. Объединить всех людей и животных в один массив.
 11. В цикле выводить тип объекта (человек или животное) перед тем как выводить его свойства и вызывать метод
 
 */

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

+ (void)performTestArrayLevelMaster {
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
}

@end
