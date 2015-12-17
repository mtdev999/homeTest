//
//  MTPatient.m
//  MTDelegateTest
//
//  Created by Mark Tezza on 28.11.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import "MTPatient.h"

#import "MTRandomValues.h"

static float const kMTMinValue = 36.6f;
static float const kMTMaxValue = 42.0f;

@interface MTPatient ()

- (float)temperatureRandom;

@end

@implementation MTPatient

#pragma mark -
#pragma mark Class Method

+ (MTPatient *)patientCame {
    return [[self alloc] init];
}

#pragma mark -
#pragma mark Initializtiona and Deallocations

- (void)dealloc {
    self.name = nil;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.temperature = [self temperatureRandom];
    }
    
    return self;
}

#pragma mark -
#pragma mark Public

- (void)takePill {
    NSLog(@"- %@ receives a pill", self.name);
}

- (void)makeShot {
    NSLog(@"- the %@ receives an injection", self.name);
}

- (void)patientFeelsBad:(void(^)(MTPatient *patient))patientBlock {
    if (self.temperature < 37) {
        NSLog(@"%@: I am feel good! My temperature is %.1f ",self.name, self.temperature);
    } else {
        NSLog(@"%@: I am feel bad! My temperature is %.1f ",self.name, self.temperature);
        patientBlock(self);
    }
}

#pragma mark -
#pragma mark Private 

- (NSString *)description {
    return [NSString stringWithFormat:@"name = %@, temperature = %.1f",
            self.name,
            self.temperature];
}

- (float)temperatureRandom {
    float addedValue = MTRandomDouble();
    float result = (float)MTRandomIntegerInRange(MTMakeRange(kMTMinValue, kMTMaxValue));
    
    return result + addedValue;
}


@end
