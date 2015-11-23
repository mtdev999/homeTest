//
//  UINib+MTExtensions.m
//  Task#2
//
//  Created by Mark Tezza on 21.09.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import "UINib+MTExtensions.h"

@implementation UINib (MTExtensions)

#pragma mark -
#pragma mark Class Methods

+ (id)objectWithClass:(Class)cls {
    return [self objectWithClass:cls owner:nil];
}

+ (id)objectWithClass:(Class)cls owner:(id)owner {
    return [[self nibWithClass:cls] objectWithClass:cls owner:owner];
}

+ (UINib *)nibWithClass:(Class)cls {
    return [UINib nibWithClass:cls bundle:nil];
}

+ (UINib *)nibWithClass:(Class)cls bundle:(NSBundle *)bundle {
    return [UINib nibWithNibName:NSStringFromClass(cls) bundle:bundle];
}

#pragma mark -
#pragma mark Public

- (id)objectWithClass:(Class)cls {
    return [self objectWithClass:cls owner:nil];
}

- (id)objectWithClass:(Class)cls owner:(id)owner {
    NSArray *array = [self instantiateWithOwner:owner options:nil];
    for (id object in array) {
        if ([object isMemberOfClass:cls]) {
            return object;
        }
    }
    
    return nil;
}

@end
