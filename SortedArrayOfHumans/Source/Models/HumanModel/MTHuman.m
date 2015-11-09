//
//  MTHuman.m
//  SortedArrayOfHumans
//
//  Created by Mark Tezza on 06.11.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import "MTHuman.h"

@implementation MTHuman

#pragma mark -
#pragma mark Initialization and Deallocation

- (void)dealloc {
    self.name = nil;
}

- (id)initWithHumanGender {
    self = [super init];
    if (self) {
        self.gender = arc4random() % 2;
    }
    return self;
}

- (instancetype)initWithName:(NSString *)name
                      weight:(float)weight
                      height:(float)height
{
    self =[self initWithHumanGender];
    if (self) {
        self.name = name;
        self.weight = weight;
        self.heigtht = height;
    }
    
    return self;
}

#pragma mark -
#pragma mark Public

- (void)movingHuman {
    NSLog(@"Human is moving;");
}

- (NSString *)description {
    return [NSString stringWithFormat:@"name = %@, weight = %.2f, height = %.2f, gender = %@",
                                                        self.name,
                                                        self.weight,
                                                        self.heigtht,
                                                        self.gender ? @"Female":@"Male"];
}

@end
