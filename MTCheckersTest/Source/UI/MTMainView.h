//
//  MTMainView.h
//  MTCheckersTest
//
//  Created by Mark Tezza on 20.01.16.
//  Copyright © 2016 Mark Tezza. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MTCheckerView;
@class MTCheckBox;
@class MTDeskView;

@interface MTMainView : UIView
@property (nonatomic, strong)   MTDeskView      *deskView;
@property (nonatomic, strong)   MTCheckerView   *checkerView;
@property (nonatomic, strong)   MTCheckBox      *checkBoxView;

@property (nonatomic, strong)   IBOutlet UIButton   *gameButton;
@property (nonatomic, strong)   IBOutlet UIButton   *helpButton;

@property (nonatomic, assign)                   BOOL    newGame;
@property (nonatomic, assign, getter=isHelp)    BOOL    help;

- (void)performLoadingNewGame;


@end
