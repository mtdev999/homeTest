//
//  MTChecker.m
//  Checkers
//
//  Created by Mark Tezza on 09.01.16.
//  Copyright © 2016 Mark Tezza. All rights reserved.
//

#import "MTChecker.h"

@implementation MTChecker

+ (MTChecker *)newChecker {
    return [[self alloc] initWithFrame];
}

- (instancetype)initWithFrame {
    self = [super init];
    if (self) {
        self.frame = [self frameCheckerView];
        self.backgroundColor = [UIColor redColor];
        self.layer.cornerRadius = 25;
    }
    return self;
}

- (CGRect)frameCheckerView {
    
    CGRect rect;
    rect = CGRectMake(0, 0, 50, 50);
    return rect;
}

- (void)createChecker {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    view.backgroundColor = [UIColor redColor];
    self.checkerView = view;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
