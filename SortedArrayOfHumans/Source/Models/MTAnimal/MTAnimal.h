//
//  MTAnimal.h
//  SortedArrayOfHumans
//
//  Created by Mark Tezza on 09.11.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MTAnimal : NSObject
@property (nonatomic, copy)     NSString    *animalNickName;
@property (nonatomic, copy)     NSString    *animalColor;
@property (nonatomic, assign)   NSUInteger  animalCountFeet;

- (instancetype)initWithAnimalNickName:(NSString *)nickName
                           animalColor:(NSString *)color
                       animalCountFeet:(NSUInteger)countFeet;

- (void)movingAnimal;

@end
