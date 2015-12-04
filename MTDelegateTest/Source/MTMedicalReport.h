//
//  MTMedicalReport.h
//  MTDelegateTest
//
//  Created by Mark Tezza on 01.12.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MTPatient.h"

@interface MTMedicalReport : NSObject
@property (nonatomic, assign)   NSUInteger  countHelpedPatients;
@property (nonatomic, assign)   NSUInteger  countNoHelpedPatients;

@property (nonatomic, readonly) NSArray     *crow;
@property (nonatomic, readonly) NSArray     *head;
@property (nonatomic, readonly) NSArray     *bally;
@property (nonatomic, readonly) NSArray     *nose;
@property (nonatomic, readonly) NSArray     *throat;

- (void)addCrowObject:(id)object;
- (void)addObject:(id)object source:(MTSourceOfPain)source;

@end
