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
                                       color:kMTDogColor
                                   countFeet:kMTCountFeet];
}

#pragma mark -
#pragma mark MTAnimal

- (void)movingAnimal {
    NSLog(@"Dog is moving;");
}

- (NSString *)description {
    return [NSString stringWithFormat:@"- animal class = %@, animal color = %@, count feet = %ld",
            self.animalClass,
            self.color,
            self.countFeet];
}

@end
