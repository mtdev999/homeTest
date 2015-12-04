//
//  MTDoctor.m
//  MTDelegateTest
//
//  Created by Mark Tezza on 28.11.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import "MTDoctor.h"

#import "MTMedicalReport.h"

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
        self.report = [MTMedicalReport new];
    }
    
    return self;
}

#pragma mark -
#pragma mark MTPatientDelegate

- (void)patientFeelsBad:(MTPatient *)patient sourceOfPain:(MTSourceOfPain)source {
    [self.report addObject:patient source:source];
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

- (void)giveReport {
    NSLog(@"Doctor '%@' report:", self.nameDoctor);
    NSLog(@"1. Patients with a headache:");
    if (self.report.head.count > 0) {
        for (MTPatient *object in self.report.head) {
            NSLog(@"Patient name: %@", object.name);
            NSLog(@"Patient temperature: %.1f", object.temperature);
            NSLog(@"Patient symptom: %@", [object stringSourceOfPainWithSource:object.sourcePain]);
        }
    } else {
        NSLog(@"Patients with such symptoms haven't been reported");
    }
    
    NSLog(@"\n");
    NSLog(@"2. Patients with a stomach ache:");
    if (self.report.bally.count > 0) {
        for (MTPatient *object in self.report.bally) {
            NSLog(@"Patient name: %@", object.name);
            NSLog(@"Patient temperature: %.1f", object.temperature);
            NSLog(@"Patient symptom: %@", [object stringSourceOfPainWithSource:object.sourcePain]);
        }
    } else {
        NSLog(@"Patients with such symptoms haven't been reported");
    }
    
    NSLog(@"\n");
    NSLog(@"3. Patients with a sore nose:");
    
    if (self.report.nose.count > 0) {
        for (MTPatient *object in self.report.nose) {
            NSLog(@"Patient name: %@", object.name);
            NSLog(@"Patient temperature: %.1f", object.temperature);
            NSLog(@"Patient symptom: %@", [object stringSourceOfPainWithSource:object.sourcePain]);
        }
    } else {
        NSLog(@"Patients with such symptoms haven't been reported");
    }
    
    NSLog(@"\n");
    NSLog(@"4. Patients with a sore throat:");
    
    if (self.report.throat.count > 0) {
        for (MTPatient *object in self.report.throat) {
            NSLog(@"Patient name: %@", object.name);
            NSLog(@"Patient temperature: %.1f", object.temperature);
            NSLog(@"Patient symptom: %@", [object stringSourceOfPainWithSource:object.sourcePain]);
        }
    } else {
        NSLog(@"Patients with such symptoms haven't been reported");
    }
    
    NSLog(@"\n");
}
#pragma mark -
#pragma mark Private

- (void)checkConditionPatient:(MTPatient *)patient {
    if ( [patient becameWorse] == NO) {
        self.countHelpedPatients += 1;
        patient.evaluationDoctor += 1;
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
