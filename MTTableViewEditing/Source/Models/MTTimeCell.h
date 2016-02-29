//
//  MTTimeCell.h
//  MTTableViewEditing
//
//  Created by Mark Tezza on 23.02.16.
//  Copyright © 2016 Mark Tezza. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MTTimeCell : NSObject
@property (nonatomic, strong)   NSString    *name;
@property (nonatomic, strong)   NSString    *taskTime;

+ (MTTimeCell *)timeCell;

@end
