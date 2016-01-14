//
//  MTCheckersView.h
//  MTCheckers
//
//  Created by Mark Tezza on 09.01.16.
//  Copyright © 2016 Mark Tezza. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MTCheckersView : UIView
@property (nonatomic, strong)   IBOutlet UIButton  *startButton;
@property (nonatomic, strong)   UIView  *deskView;
@property (nonatomic, assign)   BOOL    newGame;

- (void)setupDeskWithCells;
- (void)createCheckerView;
- (void)createDeskWithCells;

@end
