//
//  MTBadDoctor.m
//  MTDelegateTest
//
//  Created by Mark Tezza on 29.11.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import "MTBadDoctor.h"

#import "MTPatient.h"

static float const kMTMinValue = 38.0f;
static float const kMTMaxValue = 40.0f;

@implementation MTBadDoctor

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
        [patient performProcedureWithSourceOfPain:source];
        NSLog(@"Bad Doctor: I can't help you more, sorry");
        NSLog(@"__Doctor can't help patient");
        self.countNoHelpedPatients += 1;
        
    } else {
        NSLog(@"Patient %@ should rest", patient.name);
    }
}

- (void)patient:(MTPatient *)patient hasQueation:(NSString *)question {
    NSLog(@"- %@ has a question: %@", patient.name, question);
}

- (void)giveReport {
    NSLog(@"bad doctor:");
    NSLog(@"1. Patients with a headache:");
    for (MTPatient *object in self.report.head) {
        NSLog(@"Patient name: %@", object.name);
        NSLog(@"Patient temperature: %.1f", object.temperature);
        NSLog(@"Patient symptom: %@", [object stringSourceOfPainWithSource:object.sourcePain]);
    }
    NSLog(@"\n");
    NSLog(@"2. Patients with a stomach ache:");
    for (MTPatient *object in self.report.bally) {
        NSLog(@"Patient name: %@", object.name);
        NSLog(@"Patient temperature: %.1f", object.temperature);
        NSLog(@"Patient symptom: %@", [object stringSourceOfPainWithSource:object.sourcePain]);
    }
    NSLog(@"\n");
    NSLog(@"3. Patients with a sore nose:");
    for (MTPatient *object in self.report.nose) {
        NSLog(@"Patient name: %@", object.name);
        NSLog(@"Patient temperature: %.1f", object.temperature);
        NSLog(@"Patient symptom: %@", [object stringSourceOfPainWithSource:object.sourcePain]);
    }
    NSLog(@"\n");
    NSLog(@"4. Patients with a sore throat:");
    for (MTPatient *object in self.report.throat) {
        NSLog(@"Patient name: %@", object.name);
        NSLog(@"Patient temperature: %.1f", object.temperature);
        NSLog(@"Patient symptom: %@", [object stringSourceOfPainWithSource:object.sourcePain]);
    }
    NSLog(@"\n");
}

#pragma mark -
#pragma mark Private

- (void)checkConditionPatient:(MTPatient *)patient {
    if ( [patient becameWorse] == NO) {
        self.countHelpedPatients += 1;
        return NSLog(@"- %@ feels good already", patient.name);
    } else {
        [self patientFeelsBad:patient sourceOfPain:0];
    }
}

@end
