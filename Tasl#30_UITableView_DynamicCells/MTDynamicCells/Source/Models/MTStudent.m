//
//  MTStudent.m
//  MTDynamicCells
//
//  Created by Mark Tezza on 18.02.16.
//  Copyright © 2016 Mark Tezza. All rights reserved.
//

#import "MTStudent.h"

@interface MTStudent ()

@end

@implementation MTStudent

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithName:(NSString *)name
                     surname:(NSString *)surname
               averageRating:(CGFloat)averageRating
{
    self = [super init];
    if (self) {
        self.name = name;
        self.surname = surname;
        self.averageRating = averageRating;
    }
    
    return self;
}

#pragma mark -
#pragma mark Public

+ (NSArray *)arrayWithStudents {
    NSMutableArray *array = [NSMutableArray array];
    for (NSUInteger i = 0; i < 20; i++) {
        MTStudent *student = [[MTStudent alloc] initWithName:[MTStudent nameStudentWithIndex:i] surname:[MTStudent surnameStudentWithIndex:i] averageRating:3.f];
        [array addObject:student];
    }
    
    return array;
}

+ (NSString *)nameStudentWithIndex:(NSUInteger)index {
    NSMutableArray *names = [NSMutableArray arrayWithObjects:@"Smith", @"Johnson", @"Williams", @"Jones", @"Brown", @"Davis", @"Miller", @"Wilson", @"Moore", @"Taylor", @"Anderson", @"Thomas", @"Jackson", @"White", @"Harris", @"Martin", @"Thompson", @"Garcia", @"Martinez", @"Robinson", nil];

    return [names objectAtIndex:index];
}

+ (NSString *)surnameStudentWithIndex:(NSUInteger)index {
    NSMutableArray *surnames = [NSMutableArray arrayWithObjects:@"Jones", @"Williams", @"Campbell", @"Davis", @"Thompson", @"Kelly", @"Sullivan", @"O'Brien", @"Evans", @"Brown", @"Lewis", @"Wilson", @"Wallace", @"Ryan", @"Moore", @"Anderson", @"Jackson", @"Johnson", @"Smith", @"OMurphy", nil];
    
    return [surnames objectAtIndex:index];
}

@end
