//
//  MTCustomClass.h
//  MTDynamicCells
//
//  Created by Mark Tezza on 18.02.16.
//  Copyright © 2016 Mark Tezza. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MTCustomClass : NSObject
@property (nonatomic, strong) UIColor *color;
@property (nonatomic, strong) NSString *name;

+ (NSMutableArray *)arrayWithObjects;

@end
