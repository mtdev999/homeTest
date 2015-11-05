//
//  MTTestArrayLevelSuperMan.m
//  MTArrayTask@1
//
//  Created by Mark Tezza on 05.11.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

/*
 
 Уровень Супермен!
 (кодинг за гранью возможного! + вероятность успеха практически 0! + реальный вызов!)
 
 14. Соединить животных и людей в одном массиве.
 15. Используя нужный метод класса NSArray отсортировать массив (как результат будет другой массив). 
 16. Сортировать так: сначала люди, а потом животные, люди отсортированы по имени, а животные по кличкам
 17. Реально требует разобраться с сортировкой самому, тяжело, но достойно уважения

 */

#import "MTTestArrayLevelSuperMan.h"

#import "MTHuman.h"
#import "MTCycler.h"
#import "MTRunner.h"
#import "MTSwimmer.h"
#import "MTStudent.h"

#import "MTAnimal.h"
#import "MTDog.h"
#import "MTCat.h"

@implementation MTTestArrayLevelSuperMan

- (void)performTestArrayLevelSuperMan {
    NSLog(@"Level - #SuperMan#");
    
    NSArray *sortArray = [[self arrayWithObjects] sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        if ([obj1 isKindOfClass:[MTHuman class]] &&
            [obj2 isKindOfClass:[MTHuman class]]) {
            
            return [[(MTHuman*)obj1 name] compare:[(MTHuman*)obj2 name]];
            
        } else if ([obj1 isKindOfClass:[MTAnimal class]] &&
                   [obj2 isKindOfClass:[MTAnimal class]]) {
            
            return [[(MTAnimal *)obj1 nickName] compare:[(MTAnimal*)obj2 nickName]];
            
        } else if ([obj1 isKindOfClass:[MTHuman class]]) {
            
            return NSOrderedAscending;
            
        } else {
            
            return NSOrderedDescending;
        }
    }];
    
    NSLog(@"%@", sortArray);
    
//    NSMutableArray *arrayAll = [NSMutableArray arrayWithArray:[self arrayWithObjects]];
//    
//    NSSortDescriptor *sortByType = [NSSortDescriptor sortDescriptorWithKey:@"type" ascending:NO];
//    NSSortDescriptor *sortByName = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
//    [arrayAll sortUsingDescriptors:[NSArray arrayWithObjects:sortByType, sortByName, nil]];
//    for (NSObject *objects in arrayAll) {
//        NSLog(@"%@", objects);
//    }
    
}

- (NSArray *)arrayWithObjects {
    NSArray *array = [NSArray arrayWithObjects:[MTHuman human],
                                               [MTCycler humanCycler],
                                               [MTRunner humanRunner],
                                               [MTSwimmer humanSwimmer],
                                               [MTStudent humanStudent],
                                               [MTAnimal animal],
                                               [MTDog animalDog],
                                               [MTCat animalCat],
                                                nil];
    
    return array;
}

@end
