//
//  MTAnimal.h
//  MTArrayTask@1
//
//  Created by Mark Tezza on 03.11.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MTAnimal : NSObject
@property (nonatomic, copy)     NSString    *animalClass;
@property (nonatomic, copy)     NSString    *color;
@property (nonatomic, readonly) NSUInteger  countFeet;

- (instancetype)initWithAnimalClass:(NSString *)animalClass
                              color:(NSString *)color
                          countFeet:(NSUInteger)countFeet;

- (void)movingAnimal;

@end
