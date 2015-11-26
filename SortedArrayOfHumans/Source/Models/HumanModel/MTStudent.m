//
//  MTStudent.m
//  SortedArrayOfHumans
//
//  Created by Mark Tezza on 06.11.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import "MTStudent.h"

@implementation MTStudent

#pragma mark -
#pragma mark Accessors

- (NSString *)univerName {
    NSString *univerName = @"Horvard";
    return univerName;
}

#pragma mark -
#pragma mark MTHuman

- (void)movingHuman {
    NSLog(@"Student is moving;");
}

- (NSString *)description {
    return [NSString stringWithFormat:@"name = %@, weight = %.2f, height = %.2f, gender = %@ univer = %@",
            self.name,
            self.weight,
            self.heigtht,
            self.gender ? @"Female":@"Male",
            self.univerName];
}

- (void)swim {
    NSLog(@"Student swim once at week");
}

- (void)run {
    NSLog(@"Student run once at day");
}

@end
