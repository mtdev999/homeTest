//
//  MTMainView.m
//  MTCheckersTest
//
//  Created by Mark Tezza on 20.01.16.
//  Copyright © 2016 Mark Tezza. All rights reserved.
//

#import "MTMainView.h"

#import "MTDeskView.h"
#import "MTCheckerView.h"
#import "MTCheckBox.h"

#import "MTDispatch.h"

@interface MTMainView ()
@property (nonatomic, assign)   CGPoint             touchOffset;
@property (nonatomic, assign)   CGPoint             startPoint;
@property (nonatomic, assign)   CGPoint             checkerPoint;

@property (nonatomic, strong)   UIView              *dragginView;

@end

@implementation MTMainView

- (void)dealloc {
    self.deskView = nil;
    self.checkerView = nil;
    self.checkBoxView = nil;
}

#pragma mark -
#pragma mark Accessors

- (void)setNewGame:(BOOL)newGame {
    if (_newGame != newGame) {
        _newGame = newGame;
        //if (newGame) {
            [self unloadingCheckersViews];
            [self performLoadingNewGame];
            [self performSelector:@selector(loadingCheckersView) withObject:nil afterDelay:1];
//        } else {
//            [self unloadingCheckersViews];
//        }
    }
}

- (void)setCheckerView:(MTCheckerView *)checkerView {
    if (_checkerView != checkerView) {
        [_checkerView removeFromSuperview];
        _checkerView = checkerView;
    }
}

- (void)setDeskView:(MTDeskView *)deskView {
    if (_deskView != deskView) {
        [_deskView removeFromSuperview];
        _deskView = deskView;
    }
}

- (void)setHelp:(BOOL)help {
    if (_help != help) {
        _help = help;
        
        [self changeButtonTitle];
    }
}

#pragma mark -
#pragma mark Public

- (void)performLoadingNewGame {
    self.deskView = [MTDeskView loadingViewWithSuperview:self];
    self.checkBoxView = [MTCheckBox loadingCheckBoxWithDeskCellView:self];
}

- (void)unloadingCheckersViews {
    for (UIView *object in self.checkerView.arrayCheckers) {
        [object removeFromSuperview];
    }
}

- (MTCheckerView *)loadingCheckersView {
    self.checkerView = [MTCheckerView loadingCellViewWithDeskView:self.deskView];

    return self.checkerView;
}

- (MTCheckBox *)loadingCheckBoxView {
    return [MTCheckBox loadingCheckBoxWithDeskCellView:self.deskView];
}

#pragma mark -
#pragma mark Touches

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
    UIView *frontDeskView = self.deskView.frontDeskView;
    UITouch *touch = [touches anyObject];
    CGPoint pointOnMainView = [touch locationInView:frontDeskView];
    
    UIView *view = [frontDeskView hitTest:pointOnMainView withEvent:event];
    
    self.startPoint = pointOnMainView;
    
    if (![view isEqual:frontDeskView]) {
        
        self.dragginView = view;
        [frontDeskView bringSubviewToFront:view];
        
        CGPoint touchPoint = [touch locationInView:view];
        
        self.touchOffset = CGPointMake(CGRectGetMidX(view.bounds) - touchPoint.x,
                                       CGRectGetMidY(view.bounds) - touchPoint.y);
        [self onTouchesStarted];
    } else {
        self.dragginView = nil;
    }
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
    if (self.dragginView) {
        UITouch *touch = [touches anyObject];
        CGPoint pointOnMainView = [touch locationInView:self.deskView.frontDeskView];
        
        CGPoint correction = CGPointMake(pointOnMainView.x + self.touchOffset.x,
                                         pointOnMainView.y + self.touchOffset.y);
        
        self.dragginView.center = correction;
    }
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
    if (self.dragginView) {
        UITouch *touch = [touches anyObject];
        CGPoint pointOnMainView = [touch locationInView:self.deskView.frontDeskView];
        
        BOOL checkerColor = [self.dragginView.backgroundColor isEqual:[UIColor whiteColor]];
        MTCheckBox *checkView = self.checkBoxView;
        
        for (MTDeskView *cell in checkView.mutableCheckBoxCells) {
            
            NSUInteger index = [checkView.mutableCheckBoxCells indexOfObject:cell];
            NSUInteger offsetCount = checkView.mutableCheckBoxCells.count/2;
            
            BOOL result = [self containsRectInRect:cell.frame];
            
            if (CGRectContainsPoint(cell.frame, pointOnMainView)
                && !result
                &&  (checkerColor ? index >= offsetCount : index <= offsetCount))
            {
                [UIView animateWithDuration:0.3
                                 animations:^{
                                     self.dragginView.center = cell.center;
                                     [self onTuochesEnded];
                                 }];
            }  else {
                [UIView animateWithDuration:0.3
                                 animations:^{
                                     CGPoint correction = CGPointMake(self.startPoint.x + self.touchOffset.x,
                                                                      self.startPoint.y + self.touchOffset.y);
                                     
                                     self.dragginView.center = correction;
                                 }];
            }
        }
    }
    
    [self onTuochesEnded];
}

- (void)touchesCancelled:(nullable NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
    [self onTuochesEnded];
}

#pragma mark -
#pragma mark Animation

- (void)onTouchesStarted {
    [self.checkBoxView chekingPossibleMovesWithChecker:self.dragginView];
    [UIView animateWithDuration:0.2
                     animations:^{
                         self.dragginView.transform = CGAffineTransformMakeScale(1.1f, 1.1f);
                         self.dragginView.alpha = 0.8f;
                     }];
}

- (void)onTuochesEnded {
    [UIView animateWithDuration:0.2
                     animations:^{
                         self.dragginView.transform = CGAffineTransformIdentity;
                         self.dragginView.alpha = 1.0f;
                     }];
    
    self.dragginView = nil;
}

- (void)changeButtonTitle {
    UIColor *color = self.help ? [UIColor colorWithRed:0.9968 green:0.0 blue:0.3004 alpha:1.0]
                               : [UIColor colorWithRed:1.0 green:0.8824 blue:0.749 alpha:1.0];
    
    [self.helpButton setTitleColor:color
                          forState:UIControlStateNormal];
}

#pragma mark -
#pragma mark Private

- (BOOL)containsRectInRect:(CGRect)rect {
    BOOL result = NO;
    for (MTCheckerView *checker in self.checkerView.arrayCheckers) {
        result = CGRectContainsRect(rect, checker.frame);
        
        if (result) {
            return result;
        }
    }
    
    return NO;
}

- (UIViewAutoresizing)masks {
    return UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin |
    UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
}

@end
