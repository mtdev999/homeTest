//
//  MTViewDeskWithCells.m
//  Checkers
//
//  Created by Mark Tezza on 04.01.16.
//  Copyright © 2016 Mark Tezza. All rights reserved.
//

#import "MTViewDeskWithCells.h"

@interface MTViewDeskWithCells ()
@property (nonatomic, assign, getter=isColorBlack)           BOOL    firstCellIsBlack;

@end

@implementation MTViewDeskWithCells

#pragma mark -
#pragma mark Initializations and Deallocations {

- (instancetype)init {
    self = [super init];
    if (self) {
        self.arrayCells = [NSMutableArray new];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (void)setFirstCellIsBlack:(BOOL)firstCellIsBlack {
    if (_firstCellIsBlack != firstCellIsBlack) {
        _firstCellIsBlack = firstCellIsBlack;
    }
}

#pragma mark -
#pragma mark Public

- (void)createDesk {
    NSLog(@"called method");
    CGPoint point = CGPointZero;
    point.x = 0;
    point.y = CGRectGetMidY(self.bounds) - CGRectGetWidth(self.bounds)/2;
    
    CGSize size = CGSizeZero;
    size.width = CGRectGetWidth(self.frame);
    size.height = CGRectGetWidth(self.frame);
    
    
    
    UIView * viewDesk = [[UIView alloc] initWithFrame:CGRectMake(point.x, point.y, size.width, size.height)];
    
    viewDesk.backgroundColor = [UIColor clearColor];
    viewDesk.layer.borderWidth = 2.f;
    viewDesk.layer.borderColor = [UIColor grayColor].CGColor;
    
    viewDesk.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin |
    UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
    
    self.deskView = viewDesk;
    [self addSubview:viewDesk];
    
    
    [self fillingDeskViewOfCells];
}

#pragma mark -
#pragma mark Private

- (void)fillingDeskViewOfCells {
    CGPoint correct = self.correctPoint;
    correct = CGPointMake(CGRectGetMinX(self.deskView.bounds), CGRectGetMinY(self.deskView.bounds));
    self.firstCellIsBlack = NO;
    for (int i = 1; i <= 8; i++) {
        
        [self viewCells];
        
        correct.x = CGRectGetMinX(self.deskView.bounds);
        correct.y = CGRectGetMinY(self.deskView.bounds) + CGRectGetHeight(self.cellView.frame);
        
        self.correctPoint = CGPointMake(correct.x, correct.y*i);
        
        self.firstCellIsBlack = !self.firstCellIsBlack;
    }
}

- (NSMutableArray *)viewCells {
    
    NSMutableArray *array = [NSMutableArray new];
    
    for (int i = 0; i < 8; i++) {
        
        CGPoint point = self.correctPoint;
        CGSize size = CGSizeZero;
        
        size.width = CGRectGetWidth(self.frame) / 8;
        size.height = CGRectGetWidth(self.frame) / 8;
        
        UIView *viewCell = [[UIView alloc] initWithFrame:CGRectMake(point.x + size.width*i, point.y,
                                                                    size.width, size.height)];
        
        [self changeColorForFirstCell:viewCell numberIteraction:i];
        
        self.cellView = viewCell;
        
        [self.deskView addSubview:viewCell];
        [array addObject:viewCell];
        self.arrayCells = array;
    }
    
    return self.arrayCells;
}

- (void)changeColorForFirstCell:(UIView *)viewCell numberIteraction:(NSUInteger)number {
    if (self.firstCellIsBlack) {
        (0 == number % 2) ? (viewCell.backgroundColor = [UIColor whiteColor])
        : (viewCell.backgroundColor = [UIColor blackColor]);
    } else {
        (0 == number % 2) ? (viewCell.backgroundColor = [UIColor blackColor])
        : (viewCell.backgroundColor = [UIColor whiteColor]);
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
