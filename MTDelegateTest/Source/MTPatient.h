//
//  MTPatient.h
//  MTDelegateTest
//
//  Created by Mark Tezza on 28.11.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MTPatient;

@protocol MTPatientDelegate <NSObject>

- (void)patientFeelsBad:(MTPatient *)patient;
- (void)patient:(MTPatient *)patient hasQueation:(NSString *)question;

@end

@interface MTPatient :NSObject
@property (nonatomic, copy)     NSString    *name;
@property (nonatomic, assign)   float       temperature;
@property (nonatomic, weak)     id <MTPatientDelegate> delegate;

+ (MTPatient *)patientIsCame;

- (void)howAreYou;
- (void)takePill;
- (void)makeShot;

@end


