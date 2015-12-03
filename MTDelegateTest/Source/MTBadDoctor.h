//
//  MTBadDoctor.h
//  MTDelegateTest
//
//  Created by Mark Tezza on 29.11.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MTMedicalRaport.h"
#import "MTPatient.h"

@interface MTBadDoctor : MTMedicalRaport <MTPatientDelegate>
@property (nonatomic, strong)   MTMedicalRaport     *raport;

- (void)giveRaport;

@end
