//
//  MTStudent.h
//  SortedArrayOfHumans
//
//  Created by Mark Tezza on 06.11.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import "MTHuman.h"

#import "MTRunnersProtocol.h"

@interface MTStudent : MTHuman <MTRunnersProtocol>
@property (nonatomic, copy) NSString    *univerName;

@end
