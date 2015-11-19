//
//  ViewController.m
//  Task#6_types
//
//  Created by Mark Tezza on 09.11.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//
/*
 
 Задание:
 
 1. Я очень хочу чтобы вы попрактиковались создавать и использовать enum списки. Они ОЧЕНЬ распространены, они делают 
 код красивее и вносят дополнительную информацию. Это просто очень хорошая практика их использовать! Практикуйтесь! 
 Создайте кучу разных пропертей под разные энумы. Постарайтесь усвоить это сразу.
 
 2. Надо попрактиковаться со структурами. Например такое небольшое задание:
 на поле 10х10 рандомно создайте точек (разберитесь как рандомно генерировать цифры, подсказка - функция arc4random()) 
 и проверяйте какая из точек попадает в квадрат размером 3х3 в самом центре поля. Грубо говоря надо определить какие 
 из точек в массиве попадают в центр и вывести их на печать. Пробуйте и задавайте вопросы.
 
 3. Разберитесь с оболочками NSNumber и NSValue. На самом деле тут все предельно просто, но вы должны понять саму суть.
 
 */


#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // create parent rect with size 100x100 in points x=100 y=100
    UIView *parentRect = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [self.view addSubview:parentRect];
    parentRect.backgroundColor = [UIColor greenColor];
    
    // create new rect(size 40x40 points (30,30)) inside parent's rect
    CGRect newRect = CGRectMake(30, 30, 40, 40);

    UIView *newView = [[UIView alloc] initWithFrame:newRect];
    [parentRect addSubview:newView];
    newView.backgroundColor = [UIColor blueColor];
    
    // create random points
    CGPoint point;
    
    for (NSUInteger index = 0 ; index < 50; index++) {
        point.x = arc4random_uniform(100) + 30;
        point.y = arc4random_uniform(100) + 30;
        
//        point.x = arc4random() % 101;
//        point.y = arc4random() % 101;
        
        point = CGPointMake(point.x, point.y);
        
        BOOL result = CGRectContainsPoint(newRect, point);
        if (result == 1) {
            NSLog(@" %lu.result = %@, x = %f y = %f" ,(unsigned long)index, result ? @"YES":@"NO", point.x, point.y);
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
