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

@end

@implementation MTMainView

- (void)setupView {
    [self createSomeViews];
    [self animationView];
}

- (void)createSomeViews {
    NSMutableArray *array = [NSMutableArray new];
    for (int i = 0; i < 4; i++) {
        CGRect frame = self.bounds;

        CGRect rect = CGRectMake(CGRectGetMinX(frame),
                                 CGRectGetMinY(frame) +
                                 CGRectGetWidth(frame)/4 +
                                 CGRectGetWidth(frame)/4 * i,
                                 CGRectGetWidth(frame) / 4,
                                 CGRectGetWidth(frame) / 4);
        
        UIView *view = [[UIView alloc] initWithFrame:rect];

        [array addObject:view];
        
        [self addSubview:view];
        self.testView = view;
    }
    
    self.mutableViews = array;
}

- (void)animationView {
    for (int i = 0; i < self.mutableViews.count; i++) {
        [self setViewOptions:[self nextOptions:i] view:[self.mutableViews objectAtIndex:i]];
    }
}

- (UIViewAnimationOptions)nextOptions:(NSUInteger)number {
    if (number == 0) {
        return UIViewAnimationOptionCurveEaseInOut;
    } else if (number == 1) {
        return UIViewAnimationOptionCurveEaseIn;
    } else if (number == 2) {
        return UIViewAnimationOptionCurveEaseOut;
    }
    
    return UIViewAnimationOptionCurveLinear;
}

- (void)setViewOptions:(UIViewAnimationOptions)options view:(UIView *)view {
    [UIView animateWithDuration:2
                          delay:0
                        options:options | UIViewAnimationOptionAutoreverse | UIViewAnimationOptionRepeat
                     animations:^{
                         view.transform = CGAffineTransformMakeTranslation(CGRectGetMaxX(self.bounds),
                                                                           CGRectGetMinY(self.bounds));
                         view.backgroundColor = [UIColor randomColor];
                     }
                     completion:^(BOOL finished) {
                            [self animationView];
                     }];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
