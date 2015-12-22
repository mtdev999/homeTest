//
//  AppDelegate.m
//  Task#13_multythread
//
//  Created by Mark Tezza on 19.12.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//
/*
 
 Ученик.
 
 1. Создайте класс студент. У него должен быть метод - угадать ответ :)
 2. В метод передается случайное целое число например в диапазоне от 0 - 100 (или больше) и сам диапазон, чтобы студент знал где угадывать
 3. Студент генерирует случайное число в том же диапазоне пока оно не будет искомым
 4. Весь процесс угадывания реализуется в потоке в классе студент
 5. Когда студент досчитал то пусть пишет в НСЛог
 6. Создайте 5 студентов и дайте им одну и туже задачу и посмотрите кто справился с ней лучше
 
 Студент.
 
 7. Задача та же, но вместе с условием передавайте студенту блок, в котором вы и объявите результаты
 8. Блок должен определяться в томже классе, где и определялись студенты
 9. Блок должен быть вызван на главном потоке
 
 Мастер.
 
 10. Создать приватный метод класса (да да, приватный метод да еще и с плюсом), который будет возвращать статическую (то есть одну на все объекты класса студент) dispatch_queue_t, которая инициализируется при первом обращении к этому методу.
 11. Лучше в этом методе реализовать блок dispatch_once, ищите в инете как и зачем :) А что, программист всегда что-то ищет и хороший программист всегда находит.
 12. Все студенты должны выполнять свои процессы в этой queue и она должна быть CONCURRENT, типа все блоки одновременно выполняются
 
 Супермен.
 
 13. Добавьте еще один класс студента, который делает все тоже самое что вы реализовали до этого, только вместо GCD он использует NSOperation и NSOperationQueue. Вообще вынос мозга в самостоятельной работе :)
 
 */

#import "AppDelegate.h"

#import "MTStudent.h"

@interface AppDelegate ()
@property (nonatomic, strong)   NSMutableArray  *mutableArray;

@end

@implementation AppDelegate

#pragma mark -
#pragma mark Initializations and Deallocations 

- (void)dealloc {
    self.mutableArray = nil;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.mutableArray = [NSMutableArray new];
    }
    
    return self;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    for (int i = 1; i <= 5; i++) {
        MTStudent *student = [[MTStudent alloc] initWithName:[NSString stringWithFormat:@"Student%d", i]];
        [self.mutableArray addObject:student];
    }
    
    NSUInteger range = 600;
    NSLog(@"range = %lu", (unsigned long)range);
    NSUInteger number = arc4random_uniform(100)+500;
    NSLog(@"number = %lu", (unsigned long)number);
    NSLog(@"*******Level Pupil******");
    for (MTStudent *object in self.mutableArray) {
            [object guessNumber:number range:range];
        }
    sleep(2);
    NSLog(@"*******Level Student******");
    for (MTStudent *object in self.mutableArray) {
        [object guessNumber:number range:range resultBlock:^(NSString *name, float timer) {
            NSLog(@"name: %@ time: %f", name, timer);
        }];
    }

    return YES;
}

@end
