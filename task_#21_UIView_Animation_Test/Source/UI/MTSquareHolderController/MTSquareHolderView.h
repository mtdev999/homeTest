//
//  MTSquareHolderView.h
//  UITaskOne
//
//  Created by Mark Tezza on 11.09.15.
//  Copyright (c) 2015 Mark Tezza. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, MTSquarePosition) {
    MTSquarePositionUpperLeftCorner = 0,
    MTSquarePositionUpperRightCorner,
    MTSquarePositionLowerRightCorner,
    MTSquarePositionLowerLeftCorner,
    MTSquarePositionCount
};

@interface MTSquareHolderView : UIView
@property (nonatomic, strong)   UIView                  *testView;
@property (nonatomic, strong)   IBOutlet    UIView      *squareView;
@property (nonatomic, strong)   IBOutlet    UIView      *squareTwoView;
@property (strong, nonatomic)   IBOutlet    UIView      *squareThreeView;
@property (strong, nonatomic)   IBOutlet    UIView      *squareFourView;
@property (nonatomic, strong)   IBOutlet    UILabel     *squareLabel;
@property (nonatomic, strong)   IBOutlet    UIButton    *animateButton;

@property (nonatomic, assign, getter=isSquareAnimating)  BOOL      squareAnimating;
@property (nonatomic, assign)                     MTSquarePosition  squarePosition;

- (void)setSquarePosition:(MTSquarePosition)position
                 animated:(BOOL)animated;

- (void)setSquarePosition:(MTSquarePosition)position
                 animated:(BOOL)animated
        completionHandler:(void(^)(void))handler;

- (void)createSomeViews;

@end
