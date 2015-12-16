//
//  AppDelegate.m
//  Task#11_SelectorTest
//
//  Created by Mark Tezza on 16.12.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import "AppDelegate.h"
#import "MTObject.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    MTObject *object1 = [MTObject new];
    
    [object1 testMethod];
    [object1 performSelector:@selector(testMethod)];
    NSLog(@"secert = %@", [object1 performSelector:@selector(superSecretText)]);
    
    [self performSelector:@selector(testMethodWithParm1:) withObject:[NSNumber numberWithInt:11]];
    
    SEL selector1 = @selector(testMethod);
    [self performSelector:@selector(testMethod)];
    
    //SEL selector2 = @selector(testMethod:);
    //[self performSelector:@selector(testMethod:) withObject:@"testString"];
    //[self performSelector:@selector(testMethod:parametr2:) withObject:@"string one" withObject:@"string two"];

    //**************
    // create string fron selector
    NSString *stringA = NSStringFromSelector(selector1);
    // create selector from string
    SEL sel = NSSelectorFromString(stringA);
    // if you need create property with SEL then property must be 'assign', not 'strong' or 'weak'
    
    return YES;
}


- (void)testMethod {
    NSLog(@"testMethod");
}

- (void)testMethod:(NSString *)string {
    NSLog(@"%@", string);
}

- (void)testMethod:(NSString *)string parametr2:(NSString *)string2{
    NSLog(@"%@, %@ ", string, string2);
}

- (void)testMethodWithParm1:(NSUInteger)intValue {
    NSLog(@"testMethodParm1: %lu", (unsigned long)intValue);
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
