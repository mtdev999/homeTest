//
//  MTLoadingView.h
//  Task#2
//
//  Created by Mark Tezza on 12.10.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MTDeskView : UIView
@property (nonatomic, strong)   UIView              *backDeskView;
@property (nonatomic, strong)   UIView              *frontDeskView;
@property (nonatomic, strong)   UIView              *cellView;
@property (nonatomic, strong)   NSMutableArray      *mutableBlackCells;

+ (MTDeskView *)loadingViewWithSuperview:(UIView *)superview;

@end
