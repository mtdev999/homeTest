//
//  MTCellsOfDesk.h
//  MTCheckers
//
//  Created by Mark Tezza on 11.01.16.
//  Copyright © 2016 Mark Tezza. All rights reserved.
//

#import "MTCheckersView.h"

@interface MTCellsOfDesk : MTCheckersView
@property (nonatomic, strong)   UIView          *cellView;
@property (nonatomic, assign, getter=isCellFree)   BOOL            cellFree;

- (instancetype)initWithFrame:(CGRect)frame color:(UIColor *)color;

@end
