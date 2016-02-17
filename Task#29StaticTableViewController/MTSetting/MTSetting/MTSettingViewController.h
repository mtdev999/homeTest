//
//  MTSettingTableViewController.h
//  MTSetting
//
//  Created by Mark Tezza on 17.02.16.
//  Copyright © 2016 Mark Tezza. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MTSettingViewController : UITableViewController <UITextFieldDelegate>
@property (strong, nonatomic) IBOutletCollection(UITextField) NSArray *textFieldsButtons;

- (IBAction)actionTextCHanged:(UITextField *)sender;

@end
