//
//  MTStudent.m
//  MTArrayTask@1
//
//  Created by Mark Tezza on 03.11.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import "MTStudent.h"

@implementation MTStudent

#pragma mark -
#pragma mark Class Method

+ (MTStudent *)humanStudent {
    return [[self alloc] initWithName:kMTStudentName
                               weight:kMTStudentValueWeight
                               height:kMTStudentValueHeight];
}

#pragma mark -
#pragma mark MTHuman

- (void)movingHuman {
    NSLog(@"Student is moving;");
}

- (NSString *)description {
    return [NSString stringWithFormat:@"- name = %@, weight = %.2f, height = %.2f age = %ld, univer = %@",
                                        self.name,
                                        self.weight,
                                        self.height,
                                        kMTStudentValueAge,
                                        kMTStudentUniversityName];
}

@end
