//
//  MTMedicalReport.m
//  MTDelegateTest
//
//  Created by Mark Tezza on 01.12.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import "MTMedicalReport.h"

#import "MTDoctor.h"

@interface MTMedicalReport ()
@property (nonatomic, strong)   NSMutableArray  *mutableCrow;

@property (nonatomic, strong)   NSMutableArray  *mutableHead;
@property (nonatomic, strong)   NSMutableArray  *mutableBally;
@property (nonatomic, strong)   NSMutableArray  *mutableNose;
@property (nonatomic, strong)   NSMutableArray  *mutableThroat;

@end

@implementation MTMedicalReport
@dynamic crow;
@dynamic head;
@dynamic bally;
@dynamic nose;
@dynamic throat;

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.mutableCrow = nil;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.mutableCrow = [NSMutableArray new];
        
        self.mutableHead = [NSMutableArray new];
        self.mutableBally = [NSMutableArray new];
        self.mutableNose = [NSMutableArray new];
        self.mutableThroat = [NSMutableArray new];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSArray *)crow {
    return [self.mutableCrow copy];
}

- (NSArray *)head {
    return [self.mutableHead copy];
}

- (NSArray *)bally {
    return [self.mutableBally copy];
}

- (NSArray *)nose {
    return [self.mutableNose copy];
}

- (NSArray *)throat {
    return [self.mutableThroat copy];
}

#pragma mark -
#pragma mark Public

- (void)addCrowObject:(MTPatient *)object {
    NSMutableArray *array = self.mutableCrow;
    
    if (![array containsObject:object]) {
        [array addObject:object];
    }
}

- (void)addObject:(id)object source:(MTSourceOfPain)source {
    switch (source) {
        case MTSourceOfPainHead:
            [self.mutableHead addObject:object];
            break;
            
        case MTSourceOfPainBelly:
            [self.mutableBally addObject:object];
            break;
            
        case MTSourceOfPainNose:
            [self.mutableNose addObject:object];
            break;
            
        case MTSourceOfPainThroat:
            [self.mutableThroat addObject:object];
            break;
            
        case MTSourceOfPainNoPain:
            break;
            
        default:
            break;
    }
}


@end
