//
//  MTCheckBox.m
//  MTCheckers
//
//  Created by Mark Tezza on 17.01.16.
//  Copyright © 2016 Mark Tezza. All rights reserved.
//

#import "MTCheckBox.h"

@implementation MTCheckBox

#pragma mark -
#pragma mark Class Method

+ (UIView *)checkBoxView:(CGRect)frame {
    return [[self alloc] initWithFrame:frame];
}

#pragma mark -
#pragma mark Initializations adn Deallocations

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = frame;
    }
    
    return self;
}

@end
