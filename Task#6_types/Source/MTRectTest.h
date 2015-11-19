//
//  MTRectTest.h
//  Task#6_types
//
//  Created by Mark Tezza on 09.11.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, MTPoints) {
    MTPointsX,
    MTPointsY
};

typedef NS_ENUM(NSUInteger, MTSize) {
    MTSizeWidth,
    MTSizeHeightv
};

@interface MTRectTest : NSObject
@property (nonatomic, assign) MTPoints  points;
@property (nonatomic, assign) MTSize    size;

@end
