//
//  MTAnimal.m
//  SortedArrayOfHumans
//
//  Created by Mark Tezza on 09.11.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import "MTAnimal.h"

@implementation MTAnimal

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.animalNickName = nil;
    self.animalColor = nil;
}

- (instancetype)initWithAnimalNickName:(NSString *)nickName
                           animalColor:(NSString *)color
                       animalCountFeet:(NSUInteger)countFeet
{
    self = [super init];
    if (self) {
        self.animalNickName = nickName;
        self.animalColor = color;
        self.animalCountFeet = countFeet;
    }
    
    return self;
}

#pragma mark -
#pragma mark Public

- (void)movingAnimal {
    NSLog(@"Animal is moving;");
}

-(NSString *)description {
    return [NSString stringWithFormat:@"nickName = %@, animal color = %@, count feet = %ld",
                                        self.animalNickName,
                                        self.animalColor,
                                        self.animalCountFeet];
}

@end
