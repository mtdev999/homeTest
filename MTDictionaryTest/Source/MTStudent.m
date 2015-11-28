//
//  MTStudent.m
//  MTDictionaryTest
//
//  Created by Mark Tezza on 26.11.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import "MTStudent.h"

@implementation MTStudent

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.firstName = nil;
    self.lastName = nil;
    self.greetings = nil;
}

- (instancetype)initWithFirstName:(NSString *)firstName
                       lastName:(NSString *)lastName
                        greetings:(NSString *)greetings
{
    self = [super init];
    if (self) {
        self.firstName = firstName;
        self.lastName = lastName;
        self.greetings = greetings;
    }
    
    return self;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"First name: %@ second name: %@ greetings = %@",
                                        self.firstName,
                                        self.lastName,
                                        self.greetings];
}

@end
