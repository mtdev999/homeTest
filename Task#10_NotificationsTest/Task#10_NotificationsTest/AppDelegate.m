//
//  AppDelegate.m
//  Task#10_NotificationsTest
//
//  Created by Mark Tezza on 04.12.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//


/*
 
 Задание:
 
 Ученик.
 
 1. Используя мой код создать свой проект со своими классами и понять как оно работает
 2. Добавить классы "пенсионер" и "бизнесмен"
 3. Доктор следит за изменением зарплаты, бизнесмен должен следить за изменением налогов, а пенсионер за изменением пенсий.
 4. Все классы: Доктор, Пенсионер и Бизнесмен долджны следить также и за средней ценой на товар.
 
 Умничка.
 
 5. Каждый из классов следит за инфляцией (процентный рост средней цены на товар) и оценивает свой потенциальный доход по отношению к инфляции, например размер пенсии к возможности купить продукты у пенсионера, либо новая прибыль за вычетом налогов у бизнесмена также по отношению к ценам на товар.
 
 6. Не секрет что изменение этих характеристик оказывает разное влияние на разные слои населения, поэтому пусть в зависимости от уровня покупательской способности каждый класс выдает свои перлы.
 
 Мастер.
 
 7. Подпишите классы на нотификацию ухода приложения в бекграунд, чтобы когда нажимается кнопка HOME и приложение сворачивается, каждый объект заявлял о том что он идет спать
 
 8. Тоже самое сделать для случая, когда приложение возвращается из свернутого состояния
 
 Супермен
 
 9. Создайте свой класс аналог апп делегату, только он не делегат приложения, но слушатель тех же самых нотификаций, какие методы есть у делегата. Грубо говоря у вашего класса должны быть теже методы, что и у апп делегата, но вызываться они должны путем нотификаций
 
 10. Добавьте НСЛоги в каждый метод апп делегата и своего класса
 
 11. Сворачивая и разварачивая приложение добивайтесь вызовов определенный методов делегата и тех же нотификаций и посмотрите что вызывается раньше - метод делегата или нотификация :)
 
 */

#import "AppDelegate.h"

#import "MTGovernment.h"
#import "MTDoctor.h"
#import "MTBusinessman.h"
#import "MTPensioner.h"

@interface AppDelegate ()
@property (nonatomic, strong) MTDoctor *doctor;
@property (nonatomic, strong) MTBusinessman *businessman;
@property (nonatomic, strong) MTPensioner *pensioner;
@property (nonatomic, strong) MTGovernment *government;
@end

@implementation AppDelegate

- (instancetype)init {
    self = [super init];
    if (self) {
        self.doctor = [MTDoctor new];
        self.businessman = [MTBusinessman new];
        self.pensioner = [MTPensioner new];
        self.government = [MTGovernment new];
    }
    
    return self;
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    MTGovernment *government = self.government;
    MTDoctor *doctor = self.doctor;
    MTBusinessman *businessman = self.businessman;
    MTPensioner *pensioner = self.pensioner;
    
    [government addObserver:doctor];
    [government addObserver:businessman];
    [government addObserver:pensioner];
    
    [self saveVAlue];
    
    government.govSalary = 3780.f;
    government.govTaxLevel = 11.f;
    government.govPensin = 1280.f;
    government.govAveragePrice = 12.f;
    
    [self saveVAlue];
    
    government.govSalary = 3540.f;
    government.govTaxLevel = 13.5f;
    government.govPensin = 1145.f;
    government.govAveragePrice = 12.f;

    return YES;
}

- (void)saveVAlue {
    MTGovernment *government = self.government;

    self.doctor.salary = government.govSalary;
    self.businessman.taxLevel = government.govTaxLevel;
    self.pensioner.pesin = government.govPensin;
}

- (void)dealloc {
    [self.government removeAllObservers];
    
    self.doctor = nil;
    self.businessman = nil;
    self.pensioner = nil;
    self.government = nil;
}

@end
