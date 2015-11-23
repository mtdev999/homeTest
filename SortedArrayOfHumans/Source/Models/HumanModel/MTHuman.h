//
//  MTHuman.h
//  SortedArrayOfHumans
//
//  Created by Mark Tezza on 06.11.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MTRunnersProtocol.h"

//@protocol MTRunnersProtocol <NSObject>
//@optional
//- (void)endOfRunning;
//- (void)endOfRunningTwo:(NSString *)text;
//@end



@interface MTHuman : NSObject
{
    id <MTRunnersProtocol> delegateM;
}
@property (nonatomic, copy)     NSString    *name;
@property (nonatomic, assign)   float       weight;
@property (nonatomic, assign)   float       heigtht;
@property (nonatomic, assign)   BOOL        gender;

@property (nonatomic, assign)id <MTRunnersProtocol> delegate;

- (instancetype)initWithName:(NSString *)name
                      weight:(float)weight
                      height:(float)height;

- (void)movingHuman;

-(void)doRun;
-(void)doRunAfter:(float)sec;
-(void)ShowInfoTwo;

@end
