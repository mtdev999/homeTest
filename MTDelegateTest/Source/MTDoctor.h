//
//  MTDoctor.h
//  MTDelegateTest
//
//  Created by Mark Tezza on 28.11.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MTMedicalRaport.h"
#import "MTPatient.h"

@interface MTDoctor : MTMedicalRaport <MTPatientDelegate>
@property (nonatomic, strong)   MTMedicalRaport     *raport;

- (void)giveRaport;

@end
