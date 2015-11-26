//
//  ViewController.m
//  MyDelegate
//
//  Created by Mark Tezza on 23.11.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
/*
 инициализируем класс MyProtocol и присваиваем в качестве делегата класс, с которого была выполнена инициализация (MyDelegateViewController), прошу обратить внимание, что делегатом может быть любой другой класс, не обязательно тот, который создает экземпляр протокола. Затем мы добавили реализацию методов, которые объявляли в протоколе. Это может быть непривычно, поскольку обычно мы пишем реализацию метод в реализации класса. Но в нашем случае нам нужно вызывать их в реализации другого класса.
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MyProtocol *myProtocol = [MyProtocol new];
    myProtocol.delegate = self;
    
    [myProtocol doSomething];
    [myProtocol doSomethingAfter:5.0f];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)endOfSomething {
    NSLog(@"Something happened");
}

- (void)endOfSomethingTwo:(NSString *)text {
    NSLog(@"%@", text);
}

@end
