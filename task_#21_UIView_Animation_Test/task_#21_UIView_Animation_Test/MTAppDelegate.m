//
//  AppDelegate.m
//  task_#21_UIView_Animation_Test
//
//  Created by Mark Tezza on 15.01.16.
//  Copyright © 2016 Mark Tezza. All rights reserved.
//

/*
 
 Ученик.
 
 1. Создайте 4 вьюхи у левого края ипада.
 2. Ваша задача всех передвинуть горизонтально по прямой за одно и тоже время
 3. Для каждой вьюхи используйте свою интерполяцию (EasyInOut, EasyIn и т.д.). Это для того, чтобы вы увидели разницу своими собственными глазами :)
 4. Добавте реверсивную анимацию и бесконечные повторения
 5. добавьте смену цвета на рандомный
 
 Студент
 
 5. Добавьте еще четыре квадратные вьюхи по углам - красную, желтую, зеленую и синюю
 6. За одинаковое время и при одинаковой интерполяции двигайте их всех случайно, либо по, либо против часовой стрелки в другой угол.
 7. Когда анимация закончиться повторите все опять: выберите направление и передвиньте всех :)
 8. Вьюха должна принимать в новом углу цвет той вьюхи, что была здесь до него ;)
 
 Мастер
 
 8. Нарисуйте несколько анимационных картинок человечка, который ходит.
 9. Добавьте несколько человечков на эту композицию и заставьте их ходить
 
 */

#import "MTAppDelegate.h"

#import "MTSquareHolderViewController.h"

@interface MTAppDelegate ()

@end

@implementation MTAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UIWindow *window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window = window;
    
    window.rootViewController = [[MTSquareHolderViewController alloc] initWithNibName:@"MTSquareHolderViewController" bundle:nil];
    [window makeKeyAndVisible];
    
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
