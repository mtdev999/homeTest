//
//  MTCat.m
//  MTArrayTask@1
//
//  Created by Mark Tezza on 03.11.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import "MTCat.h"

@implementation MTCat

#pragma mark -
#pragma mark Class Method

+ (MTCat *)animalCat {
    return [[self alloc] initWithNickName:kMTCatnickName
                              AnimalClass:kMTAnimalClassCat
                                countFeet:kMTCountFeet];
}

#pragma mark -
#pragma mark MTAnimal

- (void)movingAnimal {
    NSLog(@"Cat is moving;");
}

@end
