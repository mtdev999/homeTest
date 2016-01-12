//
//  MTCellsOfDesk.m
//  MTCheckers
//
//  Created by Mark Tezza on 11.01.16.
//  Copyright © 2016 Mark Tezza. All rights reserved.
//

#import "MTCellsOfDesk.h"

@implementation MTCellsOfDesk

#pragma mark -
#pragma mark Class Method

+ (UIView *)createCellWithFrame:(CGRect)frame {
    return [[self alloc] initWithFrame:frame];
}

#pragma mark -
#pragma mark Initializationa and Deallocations

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = frame;
    }
    
    return self;
}

@end
