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

+ (NSArray *)sortedArrayWithName {
    
    NSArray *array = [NSArray arrayWithArray:[MTStudent arrayWithStudents]];
    
    NSArray *arrayObjects = [array sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        if ([obj1 isKindOfClass:[MTStudent class]] && [obj2 isKindOfClass:[MTStudent class]]) {
            return [[(MTStudent *)obj1 name] compare:[(MTStudent *)obj2 name]];
        } else if ([obj1 isKindOfClass:[MTStudent class]] && [obj2 isKindOfClass:[MTStudent class]]) {
            return [[(MTStudent *)obj1 surname] compare:[(MTStudent *)obj2 surname]];
        } else if ([obj2 isKindOfClass:[MTStudent class]]) {
            return NSOrderedAscending;
        } else {
            return NSOrderedDescending;
        }
    }];
    
    return arrayObjects;
}

+ (NSArray *)arrayWithStudents {
    NSMutableArray *array = [NSMutableArray array];
    for (NSUInteger i = 0; i < 20; i++) {
        MTStudent *student = [[MTStudent alloc] initWithName:[MTStudent nameStudentWithIndex:i]
                                                     surname:[MTStudent surnameStudentWithIndex:i]
                                               averageRating:[MTStudent averageRating]];
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

+ (CGFloat)averageRating {
    CGFloat result = arc4random_uniform(10) + 2;
    
    return result;
}

@end
