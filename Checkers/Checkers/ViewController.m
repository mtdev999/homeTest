//
//  ViewController.m
//  Checkers
//
//  Created by Mark Tezza on 04.01.16.
//  Copyright © 2016 Mark Tezza. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong)          UIView   *noDragginViewDesk;
@property (nonatomic, strong)          UIView   *cellView;
@property (nonatomic, strong) IBOutlet UIView   *viewDesk;
@property (nonatomic, strong)          NSMutableArray    *arrayCells;
@property (nonatomic, assign)          CGPoint  correctPoint;

@property (nonatomic, assign, getter=isColorBlack)           BOOL    firstCellIsBlack;

@end

@implementation ViewController

#pragma mark -
#pragma mark Initialization and Deallocations

- (void)dealloc {
    self.noDragginViewDesk = nil;
    self.viewDesk = nil;
    self.arrayCells = nil;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _arrayCells = [NSMutableArray new];
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

- (void)viewDidLoad {
    [super viewDidLoad];

    [self createDesk];
    
    
    for (UIView *object in self.arrayCells) {
        NSLog(@"%@ ", object);
    }
    
    NSLog(@"count: %lu", self.arrayCells.count);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark Private

- (void)createDesk {
    CGPoint point = CGPointZero;
    point.x = 0;
    point.y = CGRectGetMidY(self.view.frame) - CGRectGetWidth(self.view.frame)/2;
    
    CGSize size = CGSizeZero;
    size.width = CGRectGetWidth(self.view.frame);
    size.height = CGRectGetWidth(self.view.frame);
    
    UIView * viewDesk = [[UIView alloc] initWithFrame:CGRectMake(point.x, point.y, size.width, size.height)];
    
    viewDesk.backgroundColor = [UIColor clearColor];
    viewDesk.layer.borderWidth = 2.f;
    viewDesk.layer.borderColor = [UIColor redColor].CGColor;

    viewDesk.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin |
    UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
    
    [self.view addSubview:viewDesk];
    self.viewDesk = viewDesk;
    
    [self fillingDeskViewOfCells];
}

- (void)fillingDeskViewOfCells {
    CGPoint correct = self.correctPoint;
    correct = CGPointMake(CGRectGetMinX(self.viewDesk.bounds), CGRectGetMinY(self.viewDesk.bounds));
    self.firstCellIsBlack = NO;
    for (int i = 1; i <= 8; i++) {

        [self viewCells];
        
        correct.x = CGRectGetMinX(self.viewDesk.bounds);
        correct.y = CGRectGetMinY(self.viewDesk.bounds) + CGRectGetHeight(self.cellView.frame);
        
        self.correctPoint = CGPointMake(correct.x, correct.y*i);
        
        self.firstCellIsBlack = !self.firstCellIsBlack;
    }
}

- (NSMutableArray *)viewCells {
    
    NSMutableArray *array = [NSMutableArray new];
    
    for (int i = 0; i < 8; i++) {
        
        CGPoint point = self.correctPoint;
        CGSize size = CGSizeZero;
        
        size.width = CGRectGetWidth(self.view.frame) / 8;
        size.height = CGRectGetWidth(self.view.frame) / 8;
        
        UIView *viewCell = [[UIView alloc] initWithFrame:CGRectMake(point.x + size.width*i, point.y,
                                                                    size.width, size.height)];
        
        [self changeColorForFirstCell:viewCell numberIteraction:i];
        
        self.cellView = viewCell;
        
        [self.viewDesk addSubview:viewCell];
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

@end
