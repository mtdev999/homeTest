//
//  MTHuman.m
//  MTArrayTask@1
//
//  Created by Mark Tezza on 02.11.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import "MTHuman.h"

@implementation MTHuman

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.name = nil;
}

- (instancetype)initWithName:(NSString *)name
                      weight:(float)weight
                      height:(float)height
{
    self = [super init];
    if (self) {
        self.name = name;
        self.weight = weight;
        self.height = height;
    }
    
    return self;
}

#pragma mark -
#pragma mark Public

- (void)movingHuman {
    NSLog(@"Human is moving");
}

@end
