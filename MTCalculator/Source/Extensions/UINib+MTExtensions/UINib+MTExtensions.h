//
//  UINib+MTExtensions.h
//  Task#2
//
//  Created by Mark Tezza on 21.09.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINib (MTExtensions)

+ (id)objectWithClass:(Class)cls;
+ (id)objectWithClass:(Class)cls owner:(id)owner;

+ (UINib *)nibWithClass:(Class)cls;
+ (UINib *)nibWithClass:(Class)cls bundle:(NSBundle *)bundle;

- (id)objectWithClass:(Class)cls;
- (id)objectWithClass:(Class)cls owner:(id)owner;


@end
