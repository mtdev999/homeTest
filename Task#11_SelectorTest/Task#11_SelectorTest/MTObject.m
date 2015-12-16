//
//  MTObject.m
//  Task#11_SelectorTest
//
//  Created by Mark Tezza on 16.12.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import "MTObject.h"

@implementation MTObject

#pragma mark -
#pragma mark Public

- (void)testMethod {
    NSLog(@"testObject");
}

- (NSString *)superSecretText {
    return @"I have stolen your candy";
}

@end
