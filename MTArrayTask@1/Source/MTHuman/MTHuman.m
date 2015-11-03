//
//  MTHuman.m
//  MTArrayTask@1
//
//  Created by Mark Tezza on 02.11.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import "MTHuman.h"

@interface MTHuman ()
@property (nonatomic, assign)   float       weight;
@property (nonatomic, assign)   float       height;
@property (nonatomic, assign)   BOOL        gender;

@end

@implementation MTHuman

#pragma mark -
#pragma mark Class Method

+ (MTHuman *)human {
    return [[self alloc] initWithName:kMTHumanName
                               weight:kMTHumanValueWeight
                               height:kMTHumanValueHeight];
}

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
    NSLog(@"Human is moving;");
}

- (NSString *)description {
    return [NSString stringWithFormat:@"name = %@, weight = %.2f, height = %.2f",
                                        self.name,
                                        self.weight,
                                        self.height];
}

@end
