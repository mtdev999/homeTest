//
//  MTAppView.m
//  MyAppIntro
//
//  Created by Mark Tezza on 22.11.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import "MTAppView.h"

@interface MTAppView ()
@property (nonatomic, strong)   NSMutableArray  *viewsArray;
@property (nonatomic, strong)   NSMutableArray  *labelsArray;

@end

@implementation MTAppView

#pragma mark -
#pragma mark

- (void)dealloc {
    self.viewsArray = nil;
    self.labelsArray = nil;
}

#pragma mark -
#pragma mark Public

- (void)startAnimatingManu {
    [self putViewsInArray];
    [self putLabelsInArray];
}

- (void)animationGroupObjects:(NSMutableArray *)objects {
    for (int i = 0; i < objects.count; i++) {
        [self animationWithObject:[objects objectAtIndex:i]];
    }
}

#pragma mark -
#pragma mark Private

- (void)putViewsInArray {
    
    NSMutableArray *array = [NSMutableArray new];
    
    UIView *startView = self.startView;
    UIView *setupView = self.setupView;
    UIView *exitView = self.exitView;
    
    [array addObject:startView];
    [array addObject:setupView];
    [array addObject:exitView];
    
    self.viewsArray = array;
    [self animationGroupObjects:array];
}

- (void)putLabelsInArray {
    NSMutableArray *array = [NSMutableArray new];
    
    UILabel *start = self.startLabel;
    UILabel *setup = self.setupLabel;
    UILabel *exit = self.exitLabel;
    
    [array addObject:start];
    [array addObject:setup];
    [array addObject:exit];
    
    self.labelsArray = array;
    
    for (int i = 0; i < array.count; i++) {
        [self animationWithText:[array objectAtIndex:i]];
    }
    
    
}

- (void)animationWithObject:(UIView *)object {
    [UIView animateWithDuration:[self timeDuration:[self nextValue]]
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         object.transform = CGAffineTransformMakeTranslation(-350, 0);
                     }
                     completion:^(BOOL finished) {
                     }];
}

- (void)animationWithText:(UIView *)object {
    [UILabel animateWithDuration:[self timeDuration:[self nextValue]]
                          delay:0.5
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         object.transform = CGAffineTransformMakeTranslation(-350, 0);
                     }
                     completion:^(BOOL finished) {
                     }];
}

- (MTAnimateDuration)nextValue {
    return (self.duration) % MTAnimateDurationCount;
}

- (float)timeDuration:(MTAnimateDuration)duration {
    float cuurentInterval = 0;
    
    switch (duration) {
        case MTAnimateDurationOne:
            cuurentInterval += 0.4;
            break;
        case MTAnimateDurationTwo:
            cuurentInterval += 0.8;
            break;
        case MTAnimateDurationThree:
            cuurentInterval += 1.2;
            break;
            
        default:
            break;
    }
    self.duration = duration + 1;
    
    return cuurentInterval;
    
}

@end
