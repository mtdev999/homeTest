//
//  MTSettingsUpdate.h
//  MTSetting
//
//  Created by Mark Tezza on 02.03.16.
//  Copyright © 2016 Mark Tezza. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class MTSettingViewController;

@interface MTSettingsUpdate : NSObject

- (void)settingsSaveWithRootController:(MTSettingViewController *)controller;
- (void)settingsLoadWithRootController:(MTSettingViewController *)controller;

@end
