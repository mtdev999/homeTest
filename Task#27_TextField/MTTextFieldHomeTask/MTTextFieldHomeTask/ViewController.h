//
//  ViewController.h
//  MTTextFieldHomeTask
//
//  Created by Mark Tezza on 14.02.16.
//  Copyright © 2016 Mark Tezza. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>
@property (strong, nonatomic) IBOutletCollection(UITextField) NSArray *textFieldsCollection;

@property (strong, nonatomic) IBOutletCollection(UILabel)       NSArray     *infoLabels;

- (IBAction)actionChangeText:(UITextField *)sender;
- (IBAction)actionClearAll:(UIButton *)sender;

@end

