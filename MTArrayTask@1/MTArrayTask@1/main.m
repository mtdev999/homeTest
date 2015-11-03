//
//  main.m
//  MTArrayTask@1
//
//  Created by Mark Tezza on 02.11.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MTTestArrayLevelPupil.h"
#import "MTTestArrayLevelStudent.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        [MTTestArrayLevelPupil performTestArray];
        NSLog(@"\n");
        [MTTestArrayLevelStudent performTestArrayLevelStudent];
    }
    return 0;
}
