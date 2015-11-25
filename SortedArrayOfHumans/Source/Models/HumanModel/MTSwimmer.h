//
//  MTSwimmer.h
//  SortedArrayOfHumans
//
//  Created by Mark Tezza on 09.11.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import "MTHuman.h"

#import "MTSwimmers.h"

@interface MTSwimmer : MTHuman <MTSwimmers>
@property (nonatomic, assign) float maxSpeed;

@end
