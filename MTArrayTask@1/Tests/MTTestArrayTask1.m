//
//  MTTestArrayTask1.m
//  MTArrayTask@1
//
//  Created by Mark Tezza on 02.11.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import "MTTestArrayTask1.h"

#import "MTHuman.h"
#import "MTCycler.h"
#import "MTRunner.h"
#import "MTSwimmer.h"

@interface MTTestArrayTask1 ()
@property (nonatomic, strong) MTHuman *human;

@end

@implementation MTTestArrayTask1

#pragma mark -
#pragma mark Class Method

+ (id)performTestArray {
    
    MTHuman *human = [[MTHuman alloc] initWithName:@"anyname" weight:0 height:0];
    
    MTCycler *cycler = [[MTCycler alloc] initWithName:@"Cycler"
                                             weight:75.f
                                             height:1.82f];
    
    MTRunner *runner = [[MTRunner alloc] initWithName:@"Runner"
                                             weight:78.f
                                             height:1.85f];
    
    MTSwimmer *swimmer = [[MTSwimmer alloc] initWithName:@"Swimmer"
                                              weight:84.f
                                              height:1.90f];
    
    NSMutableArray *humans = [NSMutableArray new];
    
    [humans addObject:human];
    [humans addObject:cycler];
    [humans addObject:runner];
    [humans addObject:swimmer];

    for (id object in humans) {
        if ([object isKindOfClass:[MTHuman class]]) {
            MTHuman *people = (MTHuman *)object;
            NSLog(@"name = %@, weight = %.2f, height = %.2f", people.name, people.weight, people.height);
            
            [human movingHuman];
        }
        
        [object movingHuman];
        
    }

    return nil;
}

@end
