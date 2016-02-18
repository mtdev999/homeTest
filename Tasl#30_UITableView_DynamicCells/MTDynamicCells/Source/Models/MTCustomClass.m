//
//  MTCustomClass.m
//  MTDynamicCells
//
//  Created by Mark Tezza on 18.02.16.
//  Copyright © 2016 Mark Tezza. All rights reserved.
//

#import "MTCustomClass.h"

#import "MTRamdomValues.h"
#import "UIColor+MTExtension.h"

@implementation MTCustomClass

- (instancetype)initWithName:(NSString *)name color:(UIColor *)color {
    self = [super init];
    if (self) {
        self.name = name;
        self.color = color;
    }
    
    return self;
}

+ (NSMutableArray *)arrayWithObjects {
    NSMutableArray *array = [NSMutableArray array];
    for (int i = 0; i < 100; i++) {
        
        
        MTCustomClass *object = [[MTCustomClass alloc] initWithName:[NSString stringWithFormat:@"object name:%d", i] color:[UIColor randomColor]];
//        object.name = [NSString stringWithFormat:@"object name:%d", i];
//        object.color = [UIColor randomColor];
        [array addObject:object];
    }
    
    return array;
}


@end
