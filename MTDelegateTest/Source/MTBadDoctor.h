//
//  MTBadDoctor.h
//  MTDelegateTest
//
//  Created by Mark Tezza on 29.11.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MTMedicalReport.h"
#import "MTPatient.h"

@interface MTBadDoctor : MTMedicalReport <MTPatientDelegate>
@property (nonatomic, strong)   MTMedicalReport     *report;

- (void)giveReport;

@end
