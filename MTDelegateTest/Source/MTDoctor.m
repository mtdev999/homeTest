//
//  MTDoctor.m
//  MTDelegateTest
//
//  Created by Mark Tezza on 28.11.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import "MTDoctor.h"

@implementation MTDoctor


#pragma mark -
#pragma mark MTPatientDelegate

- (void)patientFeelsBad:(MTPatient *)patient {
    NSLog(@"%@: I am feels bad!!! My temperature is %.1f",patient.name, patient.temperature);
    
    if (patient.temperature >37.f && patient.temperature < 39.f) {
        [patient takePill];
    } else if (patient.temperature > 39.f) {
        [patient makeShot];
    } else {
        NSLog(@"Patient %@ should rest", patient.name);
    }
    
}

- (void)patient:(MTPatient *)patient hasQueation:(NSString *)question {
    NSLog(@"Patient %@ has a question: %@", patient.name, question);
}

@end
