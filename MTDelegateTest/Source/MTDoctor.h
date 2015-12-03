//
//  MTDoctor.h
//  MTDelegateTest
//
//  Created by Mark Tezza on 28.11.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MTMedicalReport.h"
#import "MTPatient.h"

@interface MTDoctor : MTMedicalReport <MTPatientDelegate>
@property (nonatomic, strong)   MTMedicalReport     *report;

- (void)giveReport;

@end
