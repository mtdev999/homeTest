//
//  AppDelegate.m
//  task#12_blockTest
//
//  Created by Mark Tezza on 16.12.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

/*
 
 Ученик. Фактически это повторить первую половину.
 
 1. В апп делегате создайте блок с без возвращаемой переменной и без параметров и вызовите его.
 2. Создайте блоки с параметрами и передайте туда строку, которую выведите на экран в последствии.
 3. Если вы не определили тип данных для ваших блоков, то сделайте это сейчас и используйте их
 4. Создайте метод который принимает блок и вызывает его и вызовите этот метод.
 
 Студент.
 5. Создайте класс студент с проперти имя и фамилия.
 6. Создайте в аппделегате 10 разных студентов, пусть у парочки будут одинаковые фамилии.
 7. Поместите всех в массив.
 8. Используя соответствующий метод сортировки массива (с блоком) отсортируйте массив студентов сначала по фамилии, а если они одинаковы то по имени.
 
 Мастер.
 9. Задание из видео. Из урока о делегатах. У пациентов удалите протокол делегат и соответствующее проперти.
 10. Добавьте метод принимающий блок когда им станет плохо.
 11. Блок должен передавать указатель на самого студента ну и на те параметры, которые были в задании по делегатам.
 12. Теперь когда пациентам поплохеет, они должны вызывать блок, а в блоке нужно принимать решения что делать (доктор не нужен делайте все в апп делегате)
 
 Супермен
 13. Познайте истинное предназначение блоков :) Пусть пациентам становится плохо не тогда когда вы их вызываете в цикле(это убрать), а через случайное время 5-15 секунд после создания (используйте специальный метод из урока по селекторам в ините пациента).
 14. не забудьте массив пациентов сделать проперти аппделегата, а то все помрут по выходе из функции так и не дождавшись :)
 
 */

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSLog(@"*********Level Pupil*********");
    
    // void block
    void(^block)(void) = ^{
        NSLog(@"test Block");
    };
    
    block();
    
    // block with parametr
    void(^blockWithParam)(NSString *) = ^(NSString *string) {
        NSLog(@"test block with parametr: string - '%@'", string);
    };

    blockWithParam(@"string");
    blockWithParam(@"string1");
    blockWithParam(@"string2");
   
    // block with parametrs
    void(^blockWithParametrs)(NSString *, NSUInteger) = ^(NSString *string, NSUInteger intValue){
        NSLog(@"test block with parametrs: string - '%@', intValue = '%lu'", string, intValue);
    };
    
    blockWithParametrs(@"string1", 111);
    blockWithParametrs(@"string2", 222);
    blockWithParametrs(@"string3", 333);
    
    // block with type and parametr
    NSString *(^blockWithReturnValueWithParametrs)(NSString*,NSUInteger) = ^(NSString *string2, NSUInteger intValue2) {
        return [NSString stringWithFormat:@"block return value with parametrs: %@, %lu", string2, intValue2];
    };
    
    NSString *result = blockWithReturnValueWithParametrs(@"string NEW", 999);
    NSLog(@"%@", result);
    
    // call method with block
    [self testBlockWithParameter:^{
        NSLog(@"Block was called");
    }];
    // call method with block, which have parameter
    [self testBlockWithParameterString:^(NSString *string) {
        NSLog(@"Block with string was called: %@", string);
    }];
    
    NSLog(@"*********Level Student********");
    
    
    
    return YES;
}

- (void)testBlockWithParameter:(void (^)(void))testBlock {
    NSLog(@"Here will be call block now!!!");
    testBlock();
}

- (void)testBlockWithParameterString:(void (^)(NSString *string))testBlockWithString {
    testBlockWithString(@"block with string");
}

@end
