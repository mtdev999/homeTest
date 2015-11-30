//
//  MTDoctor.m
//  MTDelegateTest
//
//  Created by Mark Tezza on 28.11.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import "MTDoctor.h"

static float const kMTMinValue = 37.0f;
static float const kMTMaxValue = 39.0f;
static float const kMTStepValue = 0.5f;

@interface MTDoctor ()

- (void)performDoctorProcedureWithPatient:(MTPatient *)patient sourceOfPain:(MTSourceOfPain)source;
- (NSString *)checkSourceOfPain:(MTSourceOfPain)source patient:(MTPatient *)patient;
- (void)checkConditionPatient:(MTPatient *)patient;
- (void)droppedTemperaturePatient:(MTPatient *)patient;

@end

@implementation MTDoctor

#pragma mark -
#pragma mark MTPatientDelegate

- (void)patientFeelsBad:(MTPatient *)patient sourceOfPain:(MTSourceOfPain)source {
    NSLog(@"%@: I am feel bad! My temperature is %.1f - %@",patient.name, patient.temperature, [self checkSourceOfPain:source patient:patient]);
    [self performDoctorProcedureWithPatient:patient sourceOfPain:source];
}

- (void)patient:(MTPatient *)patient hasQueation:(NSString *)question {
    NSLog(@"- %@ has a question: %@", patient.name, question);
}

#pragma mark -
#pragma mark Private

- (void)performDoctorProcedureWithPatient:(MTPatient *)patient sourceOfPain:(MTSourceOfPain)source {
    if (patient.temperature >kMTMinValue && patient.temperature < kMTMaxValue) {
        [patient takePill];
        [self checkSourceOfPain:source patient:patient];
        [self checkConditionPatient:patient];
        
    } else if (patient.temperature > kMTMaxValue) {
        [patient makeShot];
        [self checkSourceOfPain:source patient:patient];
        [self checkConditionPatient:patient];
        
    } else {
        NSLog(@"Patient %@ should rest", patient.name);
    }
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
    
    return result;
}

- (void)checkConditionPatient:(MTPatient *)patient {
    if ( [patient becameWorse] == YES) {
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
