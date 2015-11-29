//
//  MTBadDoctor.m
//  MTDelegateTest
//
//  Created by Mark Tezza on 29.11.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import "MTBadDoctor.h"

#import "MTPatient.h"

@implementation MTBadDoctor

#pragma mark -
#pragma mark

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.name = _name;
    }
    return self;
}

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
    if (patient.temperature >38.f && patient.temperature < 41.f) {
        [patient takePill];
        [self checkConditionPatient:patient];
        
    } else if (patient.temperature > 41.f) {
        [self patient:patient hasQueation:@"How much I have left to live?"];
        NSLog(@"Doctor%@: I can't help you, sorry", self);
        //[self checkConditionPatient:patient];
        
    } else {
        NSLog(@"Patient %@ should rest", patient.name);
    }
}

- (void)checkConditionPatient:(MTPatient *)patient {
    if ( [patient becameWorse] == YES) {
        return NSLog(@"- %@ feels good already", patient.name);
    } else {
        
        [self patientFeelsBad:patient];
    }
}



@end
