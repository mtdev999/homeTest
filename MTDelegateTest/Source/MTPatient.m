//
//  MTPatient.m
//  MTDelegateTest
//
//  Created by Mark Tezza on 28.11.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import "MTPatient.h"

#import "MTDoctor.h"

#import "MTRandomValues.h"

static float const kMTMinValue = 36.6f;
static float const kMTMaxValue = 42.0f;

@interface MTPatient ()

- (float)temperatureRandom;
- (void)performProcedureWithSourceOfPain:(MTSourceOfPain)source;
- (NSString *)description;
- (NSString *)stringSourceOfPainWithSource:(MTSourceOfPain)source;
- (NSUInteger)numberOfSourcePain;

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
        self.sourcePain = [self numberOfSourcePain];
    }
    
    return self;
}

#pragma mark -
#pragma mark Public

- (void)howAreYou {
    MTSourceOfPain source = self.sourcePain;
    if (self.temperature > kMTMinValue || self.sourcePain != 0) {
         NSLog(@"%@: I am feel bad! My temperature is %.1f - I have %@",
                                                                self.name,
                                                                self.temperature,
                                                                [self stringSourceOfPainWithSource:source]);
        
        [self.delegate patientFeelsBad:self sourceOfPain:source];
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
    NSLog(@"%@ became wors? %@", self.name, result ? @"YES" : @"NO");
    return result;
}


#pragma mark -
#pragma mark Private 

- (NSString *)description {
    return [NSString stringWithFormat:@"name = %@, temperature = %.1f, source of pain = %@",
            self.name,
            self.temperature,
            [self stringSourceOfPainWithSource:self.sourcePain]];
}

- (float)temperatureRandom {
    float addedValue = MTRandomDouble();
    float result = (float)MTRandomIntegerInRange(MTMakeRange(kMTMinValue, kMTMaxValue));
    
    return result + addedValue;
}

- (void)performProcedureWithSourceOfPain:(MTSourceOfPain)source {
    switch (source) {
        case MTSourceOfPainHead:
            [self takePillForHead];
            break;
            
        case MTSourceOfPainBelly:
            [self takePillForBally];
            break;
            
        case MTSourceOfPainNose:
            [self takeNasalDrops];
            break;
            
        case MTSourceOfPainThroat:
            [self takePowder];
            break;
            
        case MTSourceOfPainNoPain:
            break;
            
        default:
            break;
    }
}

- (NSString *)stringSourceOfPainWithSource:(MTSourceOfPain)source {
    NSString *result = nil;
    switch (source) {
        case MTSourceOfPainHead:
            result = @"a headache";
            break;
            
        case MTSourceOfPainBelly:
            result = @"a stomach ache";
            break;
            
        case MTSourceOfPainNose:
            result = @"a sore nose";
            break;
            
        case MTSourceOfPainThroat:
            result = @"a sore throat";
            break;
            
        case MTSourceOfPainNoPain:
            result = @"no pain)))))";
            break;
            
        default:
            break;
    }
    
    return result;
}

- (NSUInteger)numberOfSourcePain {
    return self.sourcePain = arc4random() % 5;
}

@end
