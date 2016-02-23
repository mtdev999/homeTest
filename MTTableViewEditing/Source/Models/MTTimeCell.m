//
//  MTTimeCell.m
//  MTTableViewEditing
//
//  Created by Mark Tezza on 23.02.16.
//  Copyright © 2016 Mark Tezza. All rights reserved.
//

#import "MTTimeCell.h"

@implementation MTTimeCell

+ (MTTimeCell *)timeCellWithIndex:(NSUInteger)index {
    MTTimeCell *cell = [[MTTimeCell alloc] init];
    cell.name = [NSString stringWithFormat:@"Task #"];
    cell.numberTask = index;
    
    return cell;
}

@end
