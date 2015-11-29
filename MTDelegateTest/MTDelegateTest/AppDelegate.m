//
//  AppDelegate.m
//  MTDelegateTest
//
//  Created by Mark Tezza on 28.11.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import "AppDelegate.h"

#import "MTPatient.h"
#import "MTDoctor.h"
#import "MTBadDoctor.h"

@interface AppDelegate ()
@property (nonatomic, strong)   NSMutableArray  *mutablePatients;
@property (nonatomic, strong)   MTBadDoctor     *doctorKozlina;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    NSLog(@"********Level Pupil**********");
    
    MTDoctor *doctor = [[MTDoctor alloc] init];
    
    [self createNewPatientsWithDoctor:doctor];
    [self performProcedureWithPatients];
    
   
    NSLog(@"********Level Student**********");
    
    MTBadDoctor *friend1 = [[MTBadDoctor alloc] init];
    MTBadDoctor *friend2 = [[MTBadDoctor alloc] init];

    [self createNewPatientsWithDoctor:friend1];
    [self performProcedureWithPatients];
    
    [self createNewPatientsWithDoctor:friend2];
    [self performProcedureWithPatients];
    
    NSLog(@"********Level Master**********");
    
    return YES;
}

- (void)createNewPatientsWithDoctor:(id)doctor {
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
    for (MTPatient *object in self.mutablePatients) {
        NSLog(@"Doctor: %@, how are you?", object.name);
        [object howAreYou];
        NSLog(@"\n");
    }
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
