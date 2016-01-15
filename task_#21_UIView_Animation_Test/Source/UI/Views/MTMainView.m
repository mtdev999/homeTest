//
//  MTMainView.m
//  task_#21_UIView_Animation_Test
//
//  Created by Mark Tezza on 15.01.16.
//  Copyright © 2016 Mark Tezza. All rights reserved.
//

#import "MTMainView.h"

#import "MTRamdomValues.h"
#import "UIColor+MTExtension.h"

#import "MTMacros.h"

@interface MTMainView ()
@property (nonatomic, strong)   NSMutableArray  *mutableViews;
@property (nonatomic, strong)   NSMutableArray  *mutableSquare;

@end

@implementation MTMainView

#pragma mark -
#pragma mark Public

- (void)setupView {
    [self createSomeViews];
    [self animationView];
    
    [self createSquare];
}

#pragma mark -
#pragma mark Private

- (void)createSomeViews {
    NSMutableArray *array = [NSMutableArray new];
    for (int i = 0; i < 4; i++) {
        CGRect frame = self.bounds;
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMinX(frame) + CGRectGetWidth(frame)/4,
                                                                CGRectGetMinY(frame) +
                                                                CGRectGetWidth(frame)/4 + CGRectGetWidth(frame)/4 * i,
                                                                CGRectGetWidth(frame) / 4,
                                                                CGRectGetWidth(frame) / 4)];
        view.backgroundColor = [UIColor randomColor];
        [array addObject:view];
        
        [self addSubview:view];
        self.testView = view;
    }
    
    self.mutableViews = array;
}

- (void)animationView {
    for (int i = 0; i < self.mutableViews.count; i++) {
        [self setViewOptions:[self optionsAnimationFromNumber:i] view:[self.mutableViews objectAtIndex:i]];
    }
}

- (UIViewAnimationOptions)optionsAnimationFromNumber:(NSUInteger)number {
    return number << 16 | 1 << 3 | 1 << 4;
}

- (void)setViewOptions:(UIViewAnimationOptions)options view:(UIView *)view {
    [UIView animateWithDuration:2
                          delay:0
                        options:options
                     animations:^{
                         view.transform = CGAffineTransformMakeTranslation(CGRectGetWidth(self.bounds) - CGRectGetWidth(self.bounds)/2,
                                                                           CGRectGetMinY(self.bounds));
                         view.backgroundColor = [UIColor randomColor];
                         
                     }
                     completion:^(BOOL finished) {
                     }];
}

- (void)createSquare {
    NSMutableArray *array = [NSMutableArray new];
    for (int i = 0; i < 4; i++) {
        UIView *square = [[UIView alloc] initWithFrame:self.testView.bounds];
        
        square.backgroundColor = [UIColor randomColor];
        
        [array addObject:square];
        [self addSubview:square];
    }
    
    self.mutableSquare = array;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
