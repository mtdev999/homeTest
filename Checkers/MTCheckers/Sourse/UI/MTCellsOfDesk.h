//
//  MTCellsOfDesk.h
//  MTCheckers
//
//  Created by Mark Tezza on 11.01.16.
//  Copyright © 2016 Mark Tezza. All rights reserved.
//

#import "MTCheckersView.h"

@interface MTCellsOfDesk : UIView
@property (nonatomic, strong)   UIView          *view;
@property (nonatomic, assign, getter=isCellBusy)   BOOL            cellBusy;

+ (UIView *)createCellWithFrame:(CGRect)frame;

@end
