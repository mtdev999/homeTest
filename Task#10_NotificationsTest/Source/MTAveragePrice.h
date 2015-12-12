//
//  MTAveragePrice.h
//  Task#10_NotificationsTest
//
//  Created by Mark Tezza on 12.12.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MTAveragePrice <NSObject>
@property (nonatomic, assign)   float   averagePrice;

- (void)changedAveragePrice:(id)object;

@end
