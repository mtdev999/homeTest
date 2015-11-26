//
//  MTStudent.h
//  MTDictionaryTest
//
//  Created by Mark Tezza on 26.11.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MTStudent : NSObject
@property (nonatomic, copy) NSString    *firstName;
@property (nonatomic, copy) NSString    *lastName;
@property (nonatomic, copy) NSString    *greetings;

- (instancetype)initWithFirstName:(NSString *)firstName
                         lastName:(NSString *)lastName
                        greetings:(NSString *)greetings;

@end
