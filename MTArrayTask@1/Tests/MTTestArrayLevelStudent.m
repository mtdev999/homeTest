//
//  MTTestArrayLevelPupilLevelStudent.m
//  MTArrayTask@1
//
//  Created by Mark Tezza on 03.11.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

/*
 Yровень студент:
 (небольшая импровизация + дополнительная мозговая деятельность)
 
 5. Создать еще одного наследника от класса человек, добавить в него пару новых свойств, добавить в массив и в цикле 
 вывода вывести его свойства как дополнение к свойствам человека.
 
 6. Метод "передвижение" реализовать таким образом, чтобы перед тем как выполнить свое собственное передвижение, он 
 выполнял передвижение реализованное в классе человек.
 
 7. Массив выводить в обратном порядке.
*/

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
