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
#pragma mark Class Method

+ (MTAnimal *)animal {
    return [[self alloc] initWithNickName:kMTAnimalnickName
                              AnimalClass:kMTAnimalClass
                                countFeet:kMTCountFeet];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.animalClass = nil;
    self.nickName = nil;
}

- (instancetype)initWithNickName:(NSString *)nickName
                     AnimalClass:(NSString *)animalClass
                       countFeet:(NSUInteger)countFeet
{
    self = [super init];
    if (self) {
        self.nickName = nickName;
        self.animalClass = animalClass;
        self.countFeet = countFeet;
    }
    
    return self;
}

#pragma mark -
#pragma mark Public

- (void)movingAnimal {
    NSLog(@"Animal is moving;");
}

- (NSString *)description {
    return [NSString stringWithFormat:@"- nickName = %@, animalClass = %@, count feet = %ld",
                                        self.nickName,
                                        self.animalClass,
                                        self.countFeet];
}

@end
