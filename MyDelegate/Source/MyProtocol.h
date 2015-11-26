//
//  MyProtocol.h
//  MyDelegate
//
//  Created by Mark Tezza on 23.11.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import <Foundation/Foundation.h>

//создание самого протокала и методов, которые будут вызываться у делегата
@protocol MyProtocolDelegate <NSObject>
@optional
- (void)endOfSomething;
- (void)endOfSomethingTwo:(NSString *)text;
@end



// Здесь мы будем хранить ссылку на класс, которому следует сообщить о завершении какой-то операции (вызвать метод), поскольку делегатом может быть объект любого типа - мы указали ему общий тип id
@interface MyProtocol : NSObject
{
    id <MyProtocolDelegate> delegateM;
}



// Здесь добавлены свойства для объекта delegate (важно помнить, что делегату в свойствах мы всегда должны указывать assign, т.к. протокол обычно вызывается с этого класса (делегата) и не имеет права его удалять)
@property (nonatomic, assign)id <MyProtocolDelegate> delegate;





-(void)doSomething;
-(void)doSomethingAfter:(float)sec;
-(void)ShowInfoTwo;

@end