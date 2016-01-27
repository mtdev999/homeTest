//
//  MTCellView.m
//  MTCheckersTest
//
//  Created by Mark Tezza on 22.01.16.
//  Copyright © 2016 Mark Tezza. All rights reserved.
//

#import "MTCheckerView.h"

#import "MTDeskView.h"

#import "MTMacros.h"

@interface MTCheckerView ()
@property (nonatomic, strong)   MTDeskView      *deskView;
@property (nonatomic, strong)   NSMutableArray  *mutableWhiteCheckers;
@property (nonatomic, strong)   NSMutableArray  *mutableBlackCheckers;


@end

@implementation MTCheckerView
@dynamic arrayCheckers;

#pragma mark -
#pragma mark Class Method

+ (instancetype)loadingCellViewWithDeskView:(MTDeskView *)deskView {
    MTCheckerView *checker = [[MTCheckerView alloc] init];
    [checker setupCheckerView:checker deskView:deskView];
    
    return checker;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.mutableWhiteCheckers = [NSMutableArray new];
        self.mutableBlackCheckers = [NSMutableArray new];
        //self.arrayCheckers = [self arrayCheckers];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSArray *)arrayCheckers {
    NSMutableArray *array = [NSMutableArray arrayWithArray:self.mutableWhiteCheckers];
    [array addObjectsFromArray:self.mutableBlackCheckers];

    return [array copy];
}

#pragma mark -
#pragma mark Public

- (void)unloadingCellsViews {
    NSMutableArray *arrayAllCheckers = [NSMutableArray arrayWithArray:self.mutableBlackCheckers];
    [arrayAllCheckers addObjectsFromArray:self.mutableWhiteCheckers];
    
    for (MTCheckerView *object in arrayAllCheckers) {
        [UIView animateWithDuration:0.3
                         animations:^{
                             object.transform = CGAffineTransformIdentity;
                         }];
    }
}

#pragma mark -
#pragma mark Private

- (void)setupCheckerView:(MTCheckerView *)checker deskView:(MTDeskView *)deskView {
    CGRect rect = deskView.bounds;
    self.frame = CGRectMake(CGRectGetMinX(rect),
                            CGRectGetMidY(rect) - CGRectGetWidth(rect) / 2,
                            CGRectGetWidth(rect) / 8 - 4,
                            CGRectGetWidth(rect) / 8 - 4);
    
    for (int i = 0; i < 24; i++) {
        UIView *checkerView = [[UIView alloc] initWithFrame:self.frame];
        [self setupView:checkerView];
    }
    
    [self setupWhitePieceToDesk:deskView];
    [self setupBlackPieceToDesk:deskView];
}

- (void)setupWhitePieceToDesk:(MTDeskView *)desk {
    for (int i = 0; i < 12; i++) {
        UIView *piece = [self.mutableWhiteCheckers objectAtIndex:i];
        UIView *cellOfDesk = [desk.mutableBlackCells objectAtIndex:i];
        
        [self animatePiece:piece cellDesk:cellOfDesk];
        [desk.frontDeskView addSubview:piece];
    }
}

- (void)setupBlackPieceToDesk:(MTDeskView *)desk {
    for (int i = 20; i < 32; i++) {
        UIView *piece = [self.mutableBlackCheckers objectAtIndex:(i - 20)];
        UIView *cellOfDesk = [desk.mutableBlackCells objectAtIndex:i];
        
        [self animatePiece:piece cellDesk:cellOfDesk];
        [desk.frontDeskView addSubview:piece];
    }
}

- (void)animatePiece:(UIView *)piece cellDesk:(UIView *)cellOfDesk {
    [UIView animateWithDuration:0.3
                     animations:^{
                         piece.center = cellOfDesk.center;
                     } completion:^(BOOL finished) {
                         
                     }];
}

- (UIView *)setupView:(UIView *)checkerView {
    checkerView.layer.cornerRadius = 25.f;
    checkerView.layer.borderWidth = 2.f;

    if (self.mutableWhiteCheckers.count < 12) {
        checkerView.backgroundColor = [UIColor whiteColor];
        [self imageViewWithChecker:checkerView];
        checkerView.layer.borderColor = [UIColor colorWithRed:0.5804 green:0.3922 blue:0.1961 alpha:1.0].CGColor;
        [self.mutableWhiteCheckers addObject:checkerView];
    } else {
        checkerView.backgroundColor = [UIColor blackColor];
        [self imageViewWithChecker:checkerView];
        checkerView.layer.borderColor = [UIColor colorWithRed:0.3065 green:0.3076 blue:0.2959 alpha:1.0].CGColor;
        [self.mutableBlackCheckers addObject:checkerView];
    }
    
    return checkerView;
}

- (void)imageViewWithChecker:(UIView *)checkerView {
    if ([checkerView.backgroundColor isEqual:[UIColor whiteColor]]) {
        UIImage *whiteImage = [UIImage imageNamed:@"chessWhite"];
        UIImageView *imageViewWhiteChess = [[UIImageView alloc] initWithFrame:checkerView.frame];
        imageViewWhiteChess.image = whiteImage;
        [checkerView addSubview:imageViewWhiteChess];
    } else {
        UIImage *whiteImage = [UIImage imageNamed:@"chessBlack"];
        UIImageView *imageViewWhiteChess = [[UIImageView alloc] initWithFrame:checkerView.frame];
        imageViewWhiteChess.image = whiteImage;
        [checkerView addSubview:imageViewWhiteChess];
    }
    

}

@end
