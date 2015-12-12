//
//  MTGovernment.m
//  Task#10_NotificationsTest
//
//  Created by Mark Tezza on 07.12.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import "MTGovernment.h"

#import "MTDoctor.h"
#import "MTPensioner.h"
#import "MTBusinessman.h"

@implementation MTGovernment

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    self = [super init];
    if (self) {
        self.govSalary = 0.f;
        self.govPension = 0.f;
        self.govTaxLevel = 0.f;
        self.govAveragePrice = 0.f;
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (void)setGovSalary:(float)govSalary {
    if (_govSalary != govSalary) {
        _govSalary = govSalary;
        
        [self notifyObserversWithSelector:@selector(changedSalaryWithObject:) object:self];
    }
}

- (void)setGovPension:(float)govPension {
    if (_govPension != govPension) {
        _govPension = govPension;
        
        [self notifyObserversWithSelector:@selector(changedPensionWithObject:) object:self];
    }
}

- (void)setGovTaxLevel:(float)govTaxLevel {
    if (_govTaxLevel != govTaxLevel) {
        _govTaxLevel = govTaxLevel;
        
        [self notifyObserversWithSelector:@selector(changedTaxLevelWithObject:) object:self];
    }
}

- (void)setGovAveragePrice:(float)govAveragePrice {
    if (_govAveragePrice != govAveragePrice) {
        _govAveragePrice = govAveragePrice;
        
        [self notifyObserversWithSelector:@selector(changedAveragePrice:) object:self];
    }
}

@end
