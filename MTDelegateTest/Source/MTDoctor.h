//
//  MTDoctor.h
//  MTDelegateTest
//
//  Created by Mark Tezza on 28.11.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MTPatient.h"

@interface MTDoctor : NSObject <MTPatientDelegate>

@end
