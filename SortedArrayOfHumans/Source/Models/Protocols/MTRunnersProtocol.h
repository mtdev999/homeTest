//
//  MTRunnersProtocol.h
//  MTProtocolTest
//
//  Created by Mark Tezza on 23.11.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MTRunnersProtocol <NSObject>

@required
@property (nonatomic, assign)   float   maxSpeed;

- (void)running;

@optional
@property (nonatomic, assign)   float   maxHightJump;

- (void)swimming;
- (void)jumping;

@end
