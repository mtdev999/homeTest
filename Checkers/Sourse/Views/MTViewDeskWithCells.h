//
//  MTViewDeskWithCells.h
//  Checkers
//
//  Created by Mark Tezza on 04.01.16.
//  Copyright © 2016 Mark Tezza. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MTViewDeskWithCells : UIView
@property (nonatomic, strong)   UIView              *deskView;
@property (nonatomic, strong)   UIView              *cellView;
@property (nonatomic, strong)   NSMutableArray      *arrayCells;
@property (nonatomic, assign)   CGPoint             correctPoint;

- (void)createDesk;

@end
