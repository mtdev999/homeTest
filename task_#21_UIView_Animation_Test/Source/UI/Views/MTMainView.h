//
//  MTMainView.h
//  task_#21_UIView_Animation_Test
//
//  Created by Mark Tezza on 15.01.16.
//  Copyright © 2016 Mark Tezza. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MTMainView : UIView
@property (nonatomic, strong)   UIView *testView;
@property (nonatomic, assign)   UIViewAnimationOptions  changeStyle;

- (void)setupView;

@end
