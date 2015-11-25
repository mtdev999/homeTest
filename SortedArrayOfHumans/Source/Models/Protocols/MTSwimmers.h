//
//  MTSwimmers.h
//  SortedArrayOfHumans
//
//  Created by Mark Tezza on 25.11.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MTSwimmers <NSObject>

@required
@property (nonatomic, assign)   float   maxSpeed;

-(void)swim;

@optional
@property (nonatomic, assign)   float   maxHeight;

- (NSString *)howAreYou;

@end
