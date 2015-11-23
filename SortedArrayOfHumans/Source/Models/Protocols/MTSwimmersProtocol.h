//
//  MTSwimmersProtocol.h
//  MTProtocolTest
//
//  Created by Mark Tezza on 23.11.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MTSwimmersProtocol <NSObject>

@required
@property (nonatomic, assign)   float   maxSpeed;

- (void)swimming;

@optional
@property (nonatomic, assign)   float   maxHightJump;

- (void)running;
- (void)jumping;

@end
