//
//  MTPatient.h
//  MTDelegateTest
//
//  Created by Mark Tezza on 28.11.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, MTSourceOfPain) {
    MTSourceOfPainNoPain = 0,
    MTSourceOfPainBelly,
    MTSourceOfPainNose,
    MTSourceOfPainThroat,
    MTSourceOfPainHead
};

@class MTPatient;

@protocol MTPatientDelegate <NSObject>

- (void)patientFeelsBad:(MTPatient *)patient sourceOfPain:(MTSourceOfPain)source;
- (void)patient:(MTPatient *)patient hasQueation:(NSString *)question;

@end

@interface MTPatient :NSObject
@property (nonatomic, copy)     NSString    *name;
@property (nonatomic, assign)   float       temperature;
@property (nonatomic, weak)     id <MTPatientDelegate> delegate;
@property (nonatomic, assign)   MTSourceOfPain  sourcePain;

+ (MTPatient *)patientCame;

- (void)howAreYou;
- (void)takePill;
- (void)takePillForHead;
- (void)takePillForBally;
- (void)takePowder;
- (void)takeNasalDrops;
- (void)makeShot;

- (BOOL)becameWorse;

- (void)performProcedureWithSourceOfPain:(MTSourceOfPain)source;
- (NSString *)stringSourceOfPainWithSource:(MTSourceOfPain)source;

@end


