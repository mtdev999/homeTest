//
//  MTDoctor.m
//  MTDelegateTest
//
//  Created by Mark Tezza on 28.11.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import "MTDoctor.h"

#import "MTMedicalRaport.h"

static float const kMTMinValue = 37.0f;
static float const kMTMaxValue = 39.0f;
static float const kMTStepValue = 0.5f;

@interface MTDoctor ()

- (void)checkConditionPatient:(MTPatient *)patient;
- (void)droppedTemperaturePatient:(MTPatient *)patient;

@end

@implementation MTDoctor

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    self = [super init];
    if (self) {
        self.raport = [MTMedicalRaport new];
    }
    
    return self;
}

#pragma mark -
#pragma mark MTPatientDelegate

- (void)patientFeelsBad:(MTPatient *)patient sourceOfPain:(MTSourceOfPain)source {
    [self.raport addObject:patient source:source];
    if (patient.temperature >kMTMinValue && patient.temperature < kMTMaxValue) {
        [patient takePill];
        [patient performProcedureWithSourceOfPain:source];
        [self checkConditionPatient:patient];
        
    } else if (patient.temperature > kMTMaxValue) {
        [patient makeShot];
        [patient performProcedureWithSourceOfPain:source];
        [self checkConditionPatient:patient];
        
    } else {
        NSLog(@"Patient %@ should rest", patient.name);
    }
}

- (void)patient:(MTPatient *)patient hasQueation:(NSString *)question {
    NSLog(@"- %@ has a question: %@", patient.name, question);
}

- (void)giveRaport {
    NSLog(@"Patients with headache: %@", self.raport.head);
    NSLog(@"Patients with a stomach ache: %@", self.raport.bally);
    NSLog(@"Patients with a sore nose: %@", self.raport.nose);
    NSLog(@"Patients with a sore throat: %@", self.raport.throat);
}

#pragma mark -
#pragma mark Private

- (void)checkConditionPatient:(MTPatient *)patient {
    if ( [patient becameWorse] == NO) {
        self.countHelpedPatients += 1;
        return NSLog(@"- %@ feels good already", patient.name);
        
    } else {
        [self droppedTemperaturePatient:patient];
        [self patientFeelsBad:patient sourceOfPain:0];
    }
}

- (void)droppedTemperaturePatient:(MTPatient *)patient {
    patient.temperature -= kMTStepValue;
}

@end
