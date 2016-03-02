//
//  MTSettingsUpdate.m
//  MTSetting
//
//  Created by Mark Tezza on 02.03.16.
//  Copyright © 2016 Mark Tezza. All rights reserved.
//

#import "MTSettingsUpdate.h"

#import "MTSettingViewController.h"

static NSString * const kMTSettingsLogin = @"login";
static NSString * const kMTSettingsPassword = @"password";
static NSString * const kMTSettingsName = @"name";
static NSString * const kMTSettingsSurname = @"surname";
static NSString * const kMTSettingsAge = @"age";
static NSString * const kMTSettingsPhone = @"phone";
static NSString * const kMTSettingsEmail = @"email";

@implementation MTSettingsUpdate

- (void)settingsSaveWithRootController:(MTSettingViewController *)controller {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    UITextField *loginField = [controller.textFieldsButtons objectAtIndex:0];
    UITextField *passwordField = [controller.textFieldsButtons objectAtIndex:1];
    UITextField *nameField = [controller.textFieldsButtons objectAtIndex:2];
    UITextField *surnameField = [controller.textFieldsButtons objectAtIndex:3];
    UITextField *ageField = [controller.textFieldsButtons objectAtIndex:4];
    UITextField *phoneField = [controller.textFieldsButtons objectAtIndex:5];
    UITextField *emailField = [controller.textFieldsButtons objectAtIndex:6];
    
    [userDefaults setObject:loginField.text forKey:kMTSettingsLogin];
    [userDefaults setObject:passwordField.text forKey:kMTSettingsPassword];
    [userDefaults setObject:nameField.text forKey:kMTSettingsName];
    [userDefaults setObject:surnameField.text forKey:kMTSettingsSurname];
    [userDefaults setObject:ageField.text forKey:kMTSettingsAge];
    [userDefaults setObject:phoneField.text forKey:kMTSettingsPhone];
    [userDefaults setObject:emailField.text forKey:kMTSettingsEmail];
    
    [userDefaults synchronize];
}

- (void)settingsLoadWithRootController:(MTSettingViewController *)controller {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    UITextField *loginField = [controller.textFieldsButtons objectAtIndex:0];
    UITextField *passwordField = [controller.textFieldsButtons objectAtIndex:1];
    UITextField *nameField = [controller.textFieldsButtons objectAtIndex:2];
    UITextField *surnameField = [controller.textFieldsButtons objectAtIndex:3];
    UITextField *ageField = [controller.textFieldsButtons objectAtIndex:4];
    UITextField *phoneField = [controller.textFieldsButtons objectAtIndex:5];
    UITextField *emailField = [controller.textFieldsButtons objectAtIndex:6];
    
    loginField.text = [userDefaults objectForKey:kMTSettingsLogin];
    passwordField.text = [userDefaults objectForKey:kMTSettingsPassword];
    nameField.text = [userDefaults objectForKey:kMTSettingsName];
    surnameField.text = [userDefaults objectForKey:kMTSettingsSurname];
    ageField.text = [userDefaults objectForKey:kMTSettingsAge];
    phoneField.text = [userDefaults objectForKey:kMTSettingsPhone];
    emailField.text = [userDefaults objectForKey:kMTSettingsEmail];
    
}

@end
