//
//  MTJumpers.h
//  SortedArrayOfHumans
//
//  Created by Mark Tezza on 25.11.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MTJumpers <NSObject>

@required
@property (nonatomic, assign)   float   maxHeight;

-(void)jump;

@optional
@property (nonatomic, assign)   float   maxSpeed;

- (NSString *)howAreYou;

@end
