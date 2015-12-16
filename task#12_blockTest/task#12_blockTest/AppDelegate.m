//
//  AppDelegate.m
//  task#12_blockTest
//
//  Created by Mark Tezza on 16.12.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

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
    
    [self testBlockWithParameter:^{
        NSLog(@"Block was called");
    }];
    
    NSLog(@"*********Level Student********");
    
    return YES;
}

- (void)testBlockWithParameter:(void (^)(void))testBlock {
    NSLog(@"Here will be call block now!!!");
    testBlock();
}

@end
