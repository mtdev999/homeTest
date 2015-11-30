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
        self.sourcePain = [self whatYouComplain];
    }
    
    return self;
}

#pragma mark -
#pragma mark Public

- (void)howAreYou {
    if (self.temperature > kMTMinValue) {
        [self.delegate patientFeelsBad:self];
    } else {
        NSLog(@"%@: I am feel good!", self.name);
    }
}

- (void)takePill {
    NSLog(@"- %@ receives a pill", self.name);
}

- (void)makeShot {
    NSLog(@"- the %@ receives an injection", self.name);
}

- (BOOL)becameWorse {
    BOOL result  = arc4random() % 2;
    
    return result;
}

- (NSUInteger)whatYouComplain {
    return (self.sourcePain + 1) % MTSourceOfPainCount;
}

#pragma mark -
#pragma mark Private 

- (float)temperatureRandom {
    float addedValue = MTRandomDouble();
    float result = (float)MTRandomIntegerInRange(MTMakeRange(kMTMinValue, kMTMaxValue));
    
    return result + addedValue;
}

@end
