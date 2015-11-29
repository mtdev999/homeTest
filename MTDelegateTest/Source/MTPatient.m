//
//  MTPatient.m
//  MTDelegateTest
//
//  Created by Mark Tezza on 28.11.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import "MTPatient.h"

#import "MTRandomValues.h"

@implementation MTPatient

+ (MTPatient *)patientCame {
    return [[self alloc] init];
}

#pragma mark -
#pragma mark Initializtiona and Deallocations

- (void)dealloc {
    self.name = nil;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
    
        self.temperature = [self temperatureRandom];
    }
    
    return self;
}

#pragma mark -
#pragma mark Public

- (void)howAreYou {
    if (self.temperature > 36.6f) {
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

- (BOOL)temeperatureIsDown {
    BOOL result  = arc4random() % 2;
    
    return result;
}

- (BOOL)becameWorse {
    BOOL result  = arc4random() % 2;
    
    return result;
}

#pragma mark -
#pragma mark Private 

- (float)temperatureRandom {
    
    float i = MTRandomDouble();
    
    float result = (float)MTRandomIntegerInRange(MTMakeRange((float)36.6, 41));
    
    return result + i;
}

@end
