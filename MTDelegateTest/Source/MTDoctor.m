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

- (void)performDoctorProcedureWithPatient:(MTPatient *)patient;
- (void)checkConditionPatient:(MTPatient *)patient;
- (void)droppedTemperaturePatient:(MTPatient *)patient;

@end

@implementation MTDoctor

#pragma mark -
#pragma mark MTPatientDelegate

- (void)patientFeelsBad:(MTPatient *)patient {
    NSLog(@"%@: I am feel bad! My temperature is %.1f",patient.name, patient.temperature);
    
    [self performDoctorProcedureWithPatient:patient];
}

- (void)patient:(MTPatient *)patient hasQueation:(NSString *)question {
    NSLog(@"- %@ has a question: %@", patient.name, question);
}

#pragma mark -
#pragma mark Private

- (void)performDoctorProcedureWithPatient:(MTPatient *)patient {
    if (patient.temperature >kMTMinValue && patient.temperature < kMTMaxValue) {
        [patient takePill];
        [self checkConditionPatient:patient];
        
    } else if (patient.temperature > kMTMaxValue) {
        [self patient:patient hasQueation:@"How much I have left to live?"];
        [patient makeShot];
        [self checkConditionPatient:patient];
        
    } else {
        NSLog(@"Patient %@ should rest", patient.name);
    }
}

- (void)checkConditionPatient:(MTPatient *)patient {
    if ( [patient becameWorse] == YES) {
        return NSLog(@"- %@ feels good already", patient.name);
    } else {
        [self droppedTemperaturePatient:patient];
        [self patientFeelsBad:patient];
    }
}

- (void)droppedTemperaturePatient:(MTPatient *)patient {
    patient.temperature -= kMTStepValue;
}

@end
