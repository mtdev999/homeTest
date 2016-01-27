//
//  MTLoadingView.m
//  Task#2
//
//  Created by Mark Tezza on 12.10.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import "MTDeskView.h"

#import "UINib+MTExtensions.h"
#import "UIColor+MTExtension.h"
#import "MTMacros.h"

static NSUInteger const kMTCount = 4;

@interface MTDeskView ()
@property (nonatomic, assign)   NSUInteger          numberCell;
@property (nonatomic, assign)   NSUInteger          numberRow;

@end

@implementation MTDeskView

#pragma mark -
#pragma mark Class Methods

+ (MTDeskView *)loadingViewWithSuperview:(UIView *)superview {
    MTDeskView *deskView = [[MTDeskView alloc] init];
    [superview addSubview:deskView];
    [deskView setupDeskView:deskView superview:superview];

    return deskView;
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.mutableBlackCells = nil;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.mutableBlackCells = [NSMutableArray new];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSArray *)blackCells {
    return [self.mutableBlackCells copy];
}

- (void)setNumberRow:(NSUInteger)numberRow {
    [self setNumberRow:numberRow completionHandler:nil];
}

- (void)setNumberRow:(NSUInteger)numberRow completionHandler:(void(^)(void))handler {
    NSMutableArray *array = self.mutableBlackCells;
    UIView *cellView = [[UIView alloc] initWithFrame:[self initialSizeAndPointForCell]];
    cellView.backgroundColor = [UIColor colorWithWhite:1 alpha:0];
    self.cellView = cellView;
    
    [self addSubview:cellView];
   
    NSUInteger numberCell = self.numberCell;
    
    [UIView animateWithDuration:0.01
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         cellView.backgroundColor = [UIColor blackColor];
                         cellView.alpha = 0.8f;
                         cellView.center = [self performPointForView:cellView
                                                          numberCell:numberCell
                                                           numberRow:numberRow];
                         self.numberCell += 1;
                     } completion:^(BOOL finished) {
                         _numberRow = numberRow;
                         if (handler) {
                             handler();
                             [array addObject:cellView];
                         };
                     }];
}

#pragma mark -
#pragma mark Private Methods

- (void)setupDeskView:(MTDeskView *)view superview:(UIView *)superview {
    [UIView animateWithDuration:0.2
                     animations:^{
                         view.frame = CGRectMake(CGRectGetMinX(superview.bounds),
                                                 CGRectGetMidY(superview.bounds) - CGRectGetWidth(superview.bounds)/2+17,
                                                 CGRectGetWidth(superview.bounds),
                                                 CGRectGetWidth(superview.bounds));
                         view.backgroundColor = [UIColor colorWithRed:1.0 green:0.8824 blue:0.749 alpha:0.5];
                         view.layer.borderWidth = 5.f;
                         view.layer.borderColor = [UIColor colorWithRed:0.6078 green:0.3545 blue:0.0146 alpha:0.5].CGColor;
                         view.autoresizingMask = [view masks];
                     } completion:^(BOOL finished) {
                         [self animateCellsViews];
                     }];

    CGRect rect = view.frame;
    MTDeskView *frontDeskView = [[MTDeskView alloc] initWithFrame:rect];

    [superview addSubview:frontDeskView];
    
    self.backDeskView = view;
    self.frontDeskView = frontDeskView;
}

- (void)animateCellsViews {
    if (self.numberCell < kMTCount) {
        MTWeakify(self);
        [self setNumberRow:[self nextNumberRow] completionHandler:^{
            MTStrongifyAndReturnIfNil(self);
            [self animateCellsViews];
        }];
    } else if (self.numberRow < 7){
        [self nextNumberRow];
        [self animateCellsViews];
    }
}

- (NSUInteger)nextNumberRow {
    return (self.numberCell == kMTCount)
            ? (self.numberCell = 0, _numberRow +=1)
            : self.numberRow;
}

- (CGRect)initialSizeAndPointForCell {

    CGSize size = CGSizeZero;
    size.width = CGRectGetWidth(self.frame) / 8 - 1.2;
    size.height = CGRectGetWidth(self.frame) / 8 - 1.2;
    
    CGPoint point = CGPointZero;
    CGRect frame  = self.superview.frame;
    
    point.x = arc4random() % (int)CGRectGetWidth(frame) + CGRectGetMinX(frame);
    point.y = arc4random() % (int)CGRectGetHeight(frame) + CGRectGetMinY(frame);
    
    CGRect rect = CGRectMake(point.x, point.y, size.width, size.height);
    
    return rect;
}

- (CGPoint)performPointForView:(UIView *)cellView
                    numberCell:(NSUInteger)numberCell
                     numberRow:(NSUInteger)numberRow
{
    CGPoint point = CGPointZero;
    
    point.x = CGRectGetMinX(self.frame) + CGRectGetWidth(cellView.frame) / 2 + 5;
    point.y = CGRectGetMidY(self.bounds) + CGRectGetWidth(cellView.frame) / 2 - CGRectGetWidth(self.frame)/2 + 5;
    
    if (0 == numberRow % 2) {
        point = CGPointMake(point.x +
                            CGRectGetWidth(cellView.frame) * 2 * numberCell,
                            point.y +
                            CGRectGetWidth(cellView.frame) * numberRow);
    } else {
        point = CGPointMake(point.x +
                            CGRectGetWidth(cellView.frame) * 2 * numberCell +
                            CGRectGetWidth(cellView.frame),
                            point.y +
                            CGRectGetWidth(cellView.frame) * numberRow);
    }
    
    return point;
}

- (UIViewAutoresizing)masks {
    return UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin |
    UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
}

@end
