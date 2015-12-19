//
//  MTPatient.h
//  MTDelegateTest
//
//  Created by Mark Tezza on 28.11.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MTPatient :NSObject
@property (nonatomic, copy)     NSString        *name;
@property (nonatomic, assign)   float           temperature;

+ (MTPatient *)patientCame;
- (instancetype)initWithBlock:(void(^)(MTPatient *))patientBlock;

- (void)takePill;
- (void)makeShot;
- (void)patientFeelsBad:(void(^)(MTPatient *patient))patientBlock;
- (void)feelsBad:(void(^)(MTPatient *))blockObj;

@end


