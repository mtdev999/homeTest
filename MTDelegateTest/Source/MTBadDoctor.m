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
        [self patientFeelsBad:patient sourceOfPain:0];
    }
}

@end
