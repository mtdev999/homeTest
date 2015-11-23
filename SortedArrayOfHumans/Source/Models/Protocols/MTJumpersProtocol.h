//
//  MTJumpersProtocol.h
//  MTProtocolTest
//
//  Created by Mark Tezza on 23.11.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MTJumpersProtocol <NSObject>

@required
@property (nonatomic, assign)   float   maxHightJump;

- (void)jumping;

@optional
@property (nonatomic, assign)   float   maxSpeed;

- (void)running;
- (void)swimming;

@end
