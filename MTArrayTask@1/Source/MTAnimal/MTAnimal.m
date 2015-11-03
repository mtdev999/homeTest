//
//  MTAnimal.m
//  MTArrayTask@1
//
//  Created by Mark Tezza on 03.11.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import "MTAnimal.h"

@interface MTAnimal ()
@property (nonatomic, assign)   NSUInteger  countFeet;

@end

@implementation MTAnimal

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.animalClass = nil;
    self.color = nil;
}

- (instancetype)initWithAnimalClass:(NSString *)animalClass
                              color:(NSString *)color
                          countFeet:(NSUInteger)countFeet
{
    self = [super init];
    if (self) {
        self.animalClass = animalClass;
        self.color = color;
        self.countFeet = countFeet;
    }
    
    return self;
}

#pragma mark -
#pragma mark Public

- (void)movingAnimal {
    NSLog(@"Animal is moving;");
}

@end
