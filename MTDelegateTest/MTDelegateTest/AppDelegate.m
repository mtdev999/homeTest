//
//  AppDelegate.m
//  MTDelegateTest
//
//  Created by Mark Tezza on 28.11.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

/*
 Ученик:
 
 1. Создать пару пациентов и доктора по тому же принципу что и в видео. (Доктор делегат у пациентов)
 2. У пациента пусть будет температура и другие симптомы, по которым доктор может принимать решение.
 3. У пациента сделайте метод типа стало хуже и пусть когда станет хуже, то он идет к доктору
 4. Всех пациентов объедините в массив и в цикле вызовите метод "стало хуже".
 5. Доктор должен лечить каждого согласно симптомам.
 
 Студент:
 
 6. Создайте другой класс доктора, не наследника от первого доктора, например друг :)
 7. этот друг должен лечить своих пациентов своими собственными методами и короче плохой он доктор
 8. пусть кто-то ходит к врачу, а кто-то к нему
 9. создайте пару разных объектов класса друг и пусть они лечат своих пациентов (чтобы понять что делегат это не класс, а объект)
 
 Мастер:
 
 10. Создайте список частей тела в делегате пациента (голова, живот, нога и тд) и когда пациент приходит к врачу, пусть говорит что болит.
 11. Доктор должен принимать во внимание что болит
 12. Создайте у доктора метод "рапорт". Пусть в конце дня, когда все уже нажаловались достаточно, доктор составит рапорт (выдаст имена) тех у кого болит голова, потом тех у кого болел живот и тд
 
 Супермен
 
 13. Создайте в классе пациента проперти - оценка доктору.
 14. Когда доктор вам назначает лечение некоторые пациенты должны стать недовольны.
 15. В конце дня после того как все лечение будет сделано и доктор напишет рапорт, надо пройтись по пациентам и всем недовольным поменять доктора.
 16. Начать новый день и убедиться что Недовольные пациенты таки поменяли доктора.
 */

#import "AppDelegate.h"

#import "MTPatient.h"
#import "MTDoctor.h"
#import "MTBadDoctor.h"

@interface AppDelegate ()
@property (nonatomic, strong)   NSMutableArray  *mutablePatients;
@property (nonatomic, strong)   NSMutableSet    *allPatients;
@property (nonatomic, strong)   MTPatient       *patient;
@end

@implementation AppDelegate

- (instancetype)init {
    self = [super init];
    if (self) {
        self.allPatients = [NSMutableSet new];
    }
    
    return self;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    NSLog(@"********Level Pupil**********");
    MTDoctor *doctor = [[MTDoctor alloc] init];
    doctor.nameDoctor = @"Stefansky";
    
    [self camePatientsToDoctor:doctor];
    NSLog(@"Doctor %@:", doctor.nameDoctor);
    [self performProcedureWithPatients];
    
    NSLog(@"********Level Student**********");
    MTBadDoctor *doctor1 = [[MTBadDoctor alloc] init];
    doctor1.nameDoctor = @"Sidorov";

    [self camePatientsToDoctor:doctor1];
    NSLog(@"Doctor %@:",doctor1.nameDoctor);
    [self performProcedureWithPatients];

    MTBadDoctor *doctor2 = [[MTBadDoctor alloc] init];
    doctor2.nameDoctor = @"Petrov";
    
    [self camePatientsToDoctor:doctor2];
    NSLog(@"Doctor %@:",doctor2.nameDoctor);
    [self performProcedureWithPatients];

    NSLog(@"********Level Master**********");
    [doctor giveReport];
    [doctor1 giveReport];
    [doctor2 giveReport];
    
    NSLog(@"********Level SuperMan*******");

    NSLog(@"%@", self.allPatients);
    
    return YES;
}

#pragma mark -
#pragma mark Private

- (void)camePatientsToDoctor:(id)doctor {
    NSMutableArray *patients = [NSMutableArray new];
    for (int i = 0; i < 5; i++) {
        MTPatient *patient = [MTPatient patientCame];
        
        patient.name = [NSString stringWithFormat:@"patient%d", i];
        patient.delegate = doctor;
        
        [patients addObject:patient];
        self.mutablePatients = patients;
    }
}

- (void)performProcedureWithPatients {
    NSMutableSet *set = self.allPatients;
    for (MTPatient *object in self.mutablePatients) {
        NSLog(@"doctor: %@, how are you?", object.name);
        [object howAreYou];
        [set addObject:object];
        
        NSLog(@"\n");
    }
}

@end
