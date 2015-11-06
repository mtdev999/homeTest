//
//  MTAnimal.h
//  MTArrayTask@1
//
//  Created by Mark Tezza on 03.11.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ConstantsValue.h"

@interface MTAnimal : NSObject
@property (nonatomic, copy)     NSString    *nickName;
@property (nonatomic, copy)     NSString    *animalClass;
@property (nonatomic, readonly) NSUInteger  countFeet;

+ (MTAnimal *)animal;

- (instancetype)initWithNickName:(NSString *)nickName
                     AnimalClass:(NSString *)animalClass
                       countFeet:(NSUInteger)countFeet;

- (void)movingAnimal;

@end
