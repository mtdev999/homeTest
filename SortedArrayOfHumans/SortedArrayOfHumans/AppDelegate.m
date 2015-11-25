//
//  AppDelegate.m
//  SortedArrayOfHumans
//
//  Created by Mark Tezza on 06.11.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import "AppDelegate.h"

#import "MTHuman.h"
#import "MTStudent.h"
#import "MTCycler.h"
#import "MTRunner.h"
#import "MTSwimmer.h"

#import "MTAnimal.h"
#import "MTDog.h"
#import "MTCat.h"

#import "MTSwimmers.h"
#import "MTRunners.h"

@implementation AppDelegate 


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //*******LEVEL Pupil*********
    NSLog(@"*****Level Pupil******");
    
    MTHuman *human = [[MTHuman alloc] initWithName:@"HUMAN" weight:0 height:0];
    MTCycler *cycler = [[MTCycler alloc] initWithName:@"CYCLER" weight:78 height:175];
    
    MTRunner *runner = [[MTRunner alloc] initWithName:@"RUNNER" weight:69 height:176];
    MTSwimmer *swimmer = [[MTSwimmer alloc] initWithName:@"SWIMMER" weight:86 height:191];
    swimmer.maxSpeed = 156.f;
    NSArray *humans = @[human, cycler, swimmer, runner];
    
    for (MTHuman *object in humans) {
        NSLog(@"_%@", object.description);
        [object movingHuman];
    }
    NSLog(@"\n");
    
    //*******LEVEL Student*********
    NSLog(@"*******Level Student******");
    
    MTStudent *student = [[MTStudent alloc]  initWithName:@"STUDENT" weight:54 height:169];
    
    NSMutableArray *mutableHumans = [NSMutableArray arrayWithArray:humans];
    [mutableHumans addObject:student];
    
    for (id object in mutableHumans) {
    //for (id object in [mutableHumans reverseObjectEnumerator]) { // output reverse info from array

        if ([object isKindOfClass:[MTHuman class]]) {
            MTHuman *people = (MTHuman *)object;
            NSLog(@"_%@", people.description);
            if ([object isKindOfClass:[MTStudent class]]) {
                [human movingHuman];
            }
            
            [object movingHuman];
        }
    }
    NSLog(@"\n");

    //*******LEVEL Master*********
    NSLog(@"*******Level Master******");
    
    MTAnimal *animal =[[MTAnimal alloc] initWithAnimalNickName:@"ANIMAL" animalColor:@"anyColor" animalCountFeet:4];
    MTDog *dog = [[MTDog alloc] initWithAnimalNickName:@"DOG" animalColor:@"black" animalCountFeet:4];
    MTCat *cat = [[MTCat alloc] initWithAnimalNickName:@"CAT" animalColor:@"white" animalCountFeet:4];
    
    NSArray *animals = @[animal, dog, cat];
    
    NSMutableArray *crow =[NSMutableArray arrayWithArray:mutableHumans];
    [crow addObjectsFromArray:animals];
    
    for (id object in crow) {
        if ([object isKindOfClass:[MTHuman class]]) {
            NSLog(@"Human Class:");
            MTHuman *people = (MTHuman *)object;
            NSLog(@"_%@", people.description);
            [object movingHuman];
        } else if ([object isKindOfClass:[MTAnimal class]]) {
            NSLog(@"Animal Class:");
            MTAnimal *animal = (MTAnimal *)object;
            NSLog(@"_%@", animal.description);
            [object movingAnimal];
        }
        
        NSLog(@"__________");
    }
    NSLog(@"\n");
    
    //*******LEVEL Star*********
    NSLog(@"*******Level Star******");
    
    for (NSUInteger index = 0; index < mutableHumans.count + animals.count; index++) {
        if (index < mutableHumans.count) {
            NSLog(@"_%@",mutableHumans[index]);
        }
        if (index < animals.count) {
            NSLog(@"_%@", animals[index]);
        }
        
    }
    NSLog(@"\n");
    
    //*******LEVEL SuperMan*********
    NSLog(@"*******Level SuperMan******");
    
    // part 1
    NSDictionary *dictionary = [NSDictionary new];
    dictionary = [NSDictionary dictionaryWithObjectsAndKeys:crow, @"name", nil];
    
    NSMutableArray *sortArray = [NSMutableArray new];
    [sortArray addObject:dictionary];
    NSSortDescriptor *sortName = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
    [sortArray sortUsingDescriptors:[NSArray arrayWithObjects:sortName, nil]];
    
    for (id object in sortArray) {
        NSLog(@"%@", object);
    }
    
    // part 2
    NSArray *arrayObjects = [crow sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        if ([obj1 isKindOfClass:[MTHuman class]] && [obj2 isKindOfClass:[MTHuman class]]) {
            return [[(MTHuman *)obj1 name] compare:[(MTHuman *)obj2 name]];
        }
        if ([obj1 isKindOfClass:[MTAnimal class]] && [obj2 isKindOfClass:[MTAnimal class]]) {
            return [[(MTAnimal *)obj1 animalNickName] compare:[(MTAnimal *)obj2 animalNickName]];
        } else if ([obj1 isKindOfClass:[MTHuman class]]) {
            return NSOrderedAscending;
        } else {
            return NSOrderedDescending;
        }
    }];
    
    NSLog(@"%@", arrayObjects);
    
    // ************Task_#7**************
    
    NSLog(@"*****Protocol Tests******");
    for (id object in crow) {
        if ([object isKindOfClass:[MTHuman class]]) {
            NSLog(@"Human Class:");
            
            if ([object conformsToProtocol:@protocol(MTRunners)]) {
                [object run];
            }
            
            if ([object conformsToProtocol:@protocol(MTSwimmers)]) {
                [object swim];
            } else if (![object conformsToProtocol:@protocol(MTRunners)] &&
                       ![object conformsToProtocol:@protocol(MTSwimmers)]) {
                NSLog(@"object 'lazy bitch' ");
            }
            
        } else if ([object isKindOfClass:[MTAnimal class]]) {
            NSLog(@"Animal Class:");
            MTAnimal *animal = (MTAnimal *)object;
            NSLog(@"_%@", animal.description);
            [object movingAnimal];
        }
        
        NSLog(@"__________");
    }
    NSLog(@"\n");
    
    return YES;
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
