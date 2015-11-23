//
//  MTRunnersProtocol.h
//  MTProtocolTest
//
//  Created by Mark Tezza on 23.11.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MTRunnersProtocol <NSObject>
@optional
- (void)endOfRunning;
- (void)endOfRunningTwo:(NSString *)text;

@end



