//
//  MTTestArrayLevelPupil.m
//  MTArrayTask@1
//
//  Created by Mark Tezza on 02.11.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

/*
 Уровень ученик:
 (просто повторение того что увидел)
 
 1. Создать класс "человек", который будет содержать в себе базовые качества - "имя", "рост", "вес", "пол", а также 
 будет иметь метод "передвижение".
 
 2. Создать дочерние классы (наследники) "велосипедист", "бегун", "пловец" и переопределить метод "передвижение" в 
 каждом из этих классов.
 
 3. При старте программы создать по одному объекту каждого класса и объединить их в массив.
 
 4. В цикле пройти по всем элементам массива и вывести на экран все характеристики каждого объекта (имя, рост и тд) 
 и у каждого вызвать метод "передвижение".
 */

#import "MTTestArrayLevelPupil.h"

#import "MTHuman.h"
#import "MTCycler.h"
#import "MTRunner.h"
#import "MTSwimmer.h"

@implementation MTTestArrayLevelPupil

#pragma mark -
#pragma mark Class Method

+ (void)performTestArrayLevelPupil {
    
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
}

@end
