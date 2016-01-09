//
//  MTChecker.h
//  Checkers
//
//  Created by Mark Tezza on 09.01.16.
//  Copyright © 2016 Mark Tezza. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MTChecker : UIView
@property (nonatomic, strong)   UIView  *checkerView;

+ (MTChecker *)newChecker;
- (void)createChecker;

@end
