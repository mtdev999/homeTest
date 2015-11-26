//
//  AppDelegate.m
//  MTDictionaryTest
//
//  Created by Mark Tezza on 26.11.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import "AppDelegate.h"

#import "MTStudent.h"

@interface AppDelegate ()
@property (nonatomic, strong) MTStudent *student;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // create massive with objects
    NSLog(@"*******Pupil Level********");
    NSMutableArray *array = [NSMutableArray new];
    for (int i = 1; i < 9; i++) {
        MTStudent *student = [[MTStudent alloc] initWithFirstName:[NSString stringWithFormat:@"myName%d",i]
                                                         lastName:[NSString stringWithFormat:@"mysurName%d",i]
                                                        greetings:[NSString stringWithFormat:@"Hello! I am %d student", i]];
        [array addObject:student];
    }
    
    // create dictionary with objects and keys
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionaryWithObjectsAndKeys:array, @"name", nil];
    
    NSLog(@"%@", dictionary);
    
    NSLog(@"__________");
    
    // level -student
    NSLog(@"******Student Level*******");

    
    for (NSString *name in [dictionary allKeys]) {
        
        id result = [dictionary objectForKey:name];
        NSLog(@"%@", result);
    }
    
    NSLog(@"__________");
    
    // level -master
    NSLog(@"******Master Level*******");
    NSArray *sortedObjects = [array sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        
        if ([obj1 isKindOfClass:[MTStudent class]] && [obj2 isKindOfClass:[MTStudent class]]) {
            return [[obj2 firstName] compare:[obj1 firstName]];
            
        } else if ([obj1 isKindOfClass:[MTStudent class]]) {
            return NSOrderedAscending;
        } else {
            return NSOrderedDescending;
        }
    }];
    
    NSLog(@"%@", sortedObjects);
    
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
