//
//  MTGovernment.m
//  Task#10_NotificationsTest
//
//  Created by Mark Tezza on 07.12.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import "MTGovernment.h"

#import "MTDoctor.h"
#import "MTBusinessman.h"
#import "MTPensioner.h"

@interface MTGovernment ()
@property (nonatomic, strong) MTDoctor  *doctor;

@end

@implementation MTGovernment

#pragma mark -
#pragma mark Initializations and Deallocations 

- (instancetype)init {
    self = [super init];
    if (self) {
        self.taxLevel = 5.f;
        self.salary = 3000.f;
        self.pensin = 1200.f;
        self.averagePrice = 10.f;
    }
    
    return self;
}

#pragma mark -
#pragma mark Public

- (void)changeSalary:(float)salary {
    if (self.salary != salary) {
        self.salary = salary;
        [self notifyObserversWithSelector:@selector(didChangeSalary:) object:_doctor];
    }
}

- (void)changeTaxLevel:(float)taxLevel {
    if (self.taxLevel != taxLevel) {
        self.taxLevel = taxLevel;
        [self notifyObserversWithSelector:@selector(didChangeTaxLevel:)];
    }
}

- (void)changeAveragePrice:(float)price {
    if (self.averagePrice != price) {
        self.averagePrice = price;
        [self notifyObserversWithSelector:@selector(didChangeAveragePrice:)];
    }
}

- (void)changePensin:(float)pensin {
    if (self.pensin != pensin) {
        self.pensin = pensin;
        [self notifyObserversWithSelector:@selector(didChangePensin:)];
    }
}

@end
