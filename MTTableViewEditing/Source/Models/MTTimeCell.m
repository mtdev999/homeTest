//
//  MTTimeCell.m
//  MTTableViewEditing
//
//  Created by Mark Tezza on 23.02.16.
//  Copyright © 2016 Mark Tezza. All rights reserved.
//

#import "MTTimeCell.h"

@implementation MTTimeCell

#pragma mark -
#pragma mark Public

+ (MTTimeCell *)timeCell {
    MTTimeCell *cell = [[MTTimeCell alloc] init];
    cell.name = [NSString stringWithFormat:@"Task #"];
    [cell currentTime];
    
    return cell;
}

#pragma mark -
#pragma mark Private

- (void)currentTime {
    NSDate *date = [NSDate date];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"HH:mm:ss"];
    
    self.taskTime = [dateFormatter stringFromDate:date];
}

@end
