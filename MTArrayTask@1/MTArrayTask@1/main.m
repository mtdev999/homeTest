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
#import "MTTestArrayLevelMaster.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        [MTTestArrayLevelPupil performTestArrayLevelPupil];
        NSLog(@"\n");
        
        [MTTestArrayLevelStudent performTestArrayLevelStudent];
        NSLog(@"\n");
        
        [MTTestArrayLevelMaster performTestArrayLevelMaster];
    }
    
    return 0;
}
