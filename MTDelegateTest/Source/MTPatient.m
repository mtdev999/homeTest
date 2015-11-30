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
        self.sourcePain = [self sourceOfPain];
    }
    
    return self;
}

- (NSUInteger)sourceOfPain {
    MTSourceOfPain source = self.sourcePain;
    source = arc4random() % 5;
    NSLog(@"%lu", (unsigned long)source);
    self.sourcePain = source;
    
    return source;
}

#pragma mark -
#pragma mark Public

- (void)howAreYou {
    if (self.temperature > kMTMinValue || self.sourcePain != 0) {
        [self.delegate patientFeelsBad:self sourceOfPain:self.sourcePain];
    } else {
        NSLog(@"%@: I am feel good!", self.name);
    }
}

- (void)takePill {
    NSLog(@"- %@ receives a pill", self.name);
}

- (void)takePillForHead {
     NSLog(@"- %@ receives a pill for Head", self.name);
}

- (void)takePillForBally {
    NSLog(@"- %@ receives a pill for Bally", self.name);
}

- (void)takePowder {
    NSLog(@"- %@ receives powder for throat", self.name);
}

- (void)takeNasalDrops {
    NSLog(@"- %@ receives nasal drops", self.name);
}

- (void)makeShot {
    NSLog(@"- the %@ receives an injection", self.name);
}

- (BOOL)becameWorse {
    BOOL result  = arc4random() % 2;
    
    return result;
}

#pragma mark -
#pragma mark Private 

- (float)temperatureRandom {
    float addedValue = MTRandomDouble();
    float result = (float)MTRandomIntegerInRange(MTMakeRange(kMTMinValue, kMTMaxValue));
    
    return result + addedValue;
}

- (NSString *)checkSourceOfPain:(MTSourceOfPain)source patient:(MTPatient *)patient {
    NSString *result = nil;
    
    switch (source) {
        case MTSourceOfPainHead:
            result = @"I have a headache";
            [patient takePillForHead];
            break;
            
        case MTSourceOfPainBelly:
            result = @"I have a stomach ache";
            [patient takePillForBally];
            break;
            
        case MTSourceOfPainNose:
            result = @"I have a sore nose";
            [patient takeNasalDrops];
            break;
            
        case MTSourceOfPainThroat:
            result = @"I have a sore throat";
            [patient takePowder];
            break;
        case MTSourceOfPainNoPain:
            result = @"I have no pain)))))";
            break;
            
        default:
            break;
    }
    
    self.sourcePain = source;
    
    return result;
}

@end
