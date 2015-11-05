//
//  MTDog.m
//  MTArrayTask@1
//
//  Created by Mark Tezza on 03.11.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import "MTDog.h"

@implementation MTDog

#pragma mark -
#pragma mark Class Method

+ (MTDog *)animalDog {
    return [[self alloc] initWithAnimalClass:kMTAnimalClassDog
                                       nickName:kMTDognickName
                                   countFeet:kMTCountFeet];
}

#pragma mark -
#pragma mark MTAnimal

- (void)movingAnimal {
    NSLog(@"Dog is moving;");
}

- (NSString *)description {
    return [NSString stringWithFormat:@"- animal class = %@, animal nickName = %@, count feet = %ld",
            self.animalClass,
            self.nickName,
            self.countFeet];
}

@end
