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

//+ (UIView *)createCell {
//    return [[self alloc] initWithFrame:];
//}

#pragma mark -
#pragma mark Initializationa and Deallocations

- (instancetype)initWithFrame:(CGRect)frame color:(UIColor *)color {
    self = [super init];
    if (self) {
        self.frame = frame;
        self.backgroundColor = color;
        self.cellFree = YES;
    }
    
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
