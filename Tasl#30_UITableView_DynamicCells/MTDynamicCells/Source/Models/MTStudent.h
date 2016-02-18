//
//  MTStudent.h
//  MTDynamicCells
//
//  Created by Mark Tezza on 18.02.16.
//  Copyright © 2016 Mark Tezza. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MTStudent : NSObject
@property (nonatomic, strong)   NSString    *name;
@property (nonatomic, strong)   NSString    *surname;
@property (nonatomic, assign)   CGFloat     averageRating;

+ (NSArray *)arrayWithStudents;

@end
