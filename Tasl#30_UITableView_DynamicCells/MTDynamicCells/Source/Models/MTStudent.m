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
               averageRating:(CGFloat)valueAverageRating
{
    self = [super init];
    if (self) {
        self.name = name;
        self.surname = surname;
        self.valueAverageRating = valueAverageRating;
    }
    
    return self;
}

#pragma mark -
#pragma mark Public

- (NSArray *)sortedArrayWithName {
    NSArray *array = [NSArray arrayWithArray:[self arrayWithStudents]];
    NSArray *arrayObjects = [array sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        if ([[obj1 name] compare:[obj2 name]] == NSOrderedAscending) {
            return (NSComparisonResult)NSOrderedAscending;
        }
        if ([[obj1 name] compare:[obj2 name]] == NSOrderedDescending) {
            return (NSComparisonResult)NSOrderedDescending;
        }
        
        return (NSComparisonResult)NSOrderedSame;
    }];
    
    return arrayObjects;
}

- (NSArray *)arrayWithStudents {
    NSMutableArray *array = [NSMutableArray array];
    for (NSUInteger i = 0; i < 20; i++) {
        MTStudent *student = [[MTStudent alloc] initWithName:[self nameStudentWithIndex:[self indexNames]]
                                                     surname:[self surnameStudentWithIndex:[self indexNames]]
                                               averageRating:[self averageRating]];
        [array addObject:student];
    }

    return array;
}

- (NSString *)nameStudentWithIndex:(NSUInteger)index {
    NSMutableArray *names = [NSMutableArray arrayWithObjects:@"Jessica", @"Josh", @"Williams", @"Jake", @"Brandon",
                             @"Joshua", @"Scott", @"David", @"Olivia", @"Henry", @"Adam", @"Thomas", @"Jennifer",
                             @"Sarah", @"Harris", @"Martin", @"Amelia", @"Brandon", @"Richard", @"Robert", nil];

    return [names objectAtIndex:index];
}

- (NSString *)surnameStudentWithIndex:(NSUInteger)index {
    NSMutableArray *surnames = [NSMutableArray arrayWithObjects:@"Jones", @"Williams", @"Campbell", @"Davis",
                                @"Thompson", @"Kelly", @"Sullivan", @"O'Brien", @"Evans", @"Brown", @"Lewis",
                                @"Wilson", @"Wallace", @"Ryan", @"Moore", @"Anderson", @"Jackson", @"Johnson",
                                @"Smith", @"OMurphy", nil];
    
    return [surnames objectAtIndex:index];
}

- (CGFloat)averageRating {
    CGFloat result = arc4random_uniform(10) + 2;
    
    return result;
}

- (NSUInteger)indexNames {
    NSUInteger index = arc4random_uniform(20);
    
    return index;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"name:%@ surname:%@ averageRating:%.1f",
                                        self.name, self.surname, self.valueAverageRating];
}

@end
