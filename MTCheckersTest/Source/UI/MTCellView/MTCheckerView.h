//
//  MTCellView.h
//  MTCheckersTest
//
//  Created by Mark Tezza on 22.01.16.
//  Copyright © 2016 Mark Tezza. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MTDeskView;

@interface MTCheckerView : UIView
@property (nonatomic, strong)   UIView    *checkerView;
@property (nonatomic, readonly)   NSArray    *arrayCheckers;

+ (instancetype)loadingCellViewWithDeskView:(MTDeskView *)deskView;
- (void)unloadingCellsViews;

@end
