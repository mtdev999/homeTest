//
//  MTStudent.h
//  SortedArrayOfHumans
//
//  Created by Mark Tezza on 06.11.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import "MTHuman.h"

#import "MTSwimmers.h"
#import "MTRunners.h"

@interface MTStudent : MTHuman <MTSwimmers, MTRunners>
@property (nonatomic, copy) NSString    *univerName;

@end
