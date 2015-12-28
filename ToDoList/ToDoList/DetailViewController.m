//
//  ViewController.m
//  ToDoList
//
//  Created by Mark Tezza on 28.12.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()<UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField      *textField;
@property (strong, nonatomic) IBOutlet UIDatePicker     *datePicker;
@property (strong, nonatomic) IBOutlet UIButton         *buttonSave;



@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.buttonSave.userInteractionEnabled = NO;
    
    // setting minimum value of date
    self.datePicker.minimumDate = [NSDate date];
    
    // call method 'changeValueDatePicker' when an event occurs
    [self.datePicker addTarget:self action:@selector(changeValueDatePicker) forControlEvents:UIControlEventValueChanged];
    
    [self.buttonSave addTarget:self action:@selector(save) forControlEvents:UIControlEventTouchUpInside];
    
    // create new gesture recognizer;
    UITapGestureRecognizer *handleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleEndEditing)];
    
    // added creating gesterRecognizer on view;
    [self.view addGestureRecognizer:handleTap];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark Private

// this method for outputting info about date to consol;
- (void)changeValueDatePicker {
    self.eventDate = self.datePicker.date;
    NSLog(@"event date%@", self.eventDate);
}

- (void)handleEndEditing {
    [self.view endEditing:YES];
}

- (void)save {
    
    NSString *eventInfo = self.textField.text;
    
    NSDateFormatter *formater = [NSDateFormatter new];
    formater.dateFormat = @"HH:mm dd.MMM.yyyy";
    
    NSString *eventDate = [formater stringFromDate:self.eventDate];
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:
                          eventInfo, @"eventInfo",
                          eventDate, @"eventDate",
                          nil];
    
    UILocalNotification *notify = [UILocalNotification new];
    notify.userInfo = dict;
    notify.timeZone = [NSTimeZone defaultTimeZone];
    notify.fireDate = self.eventDate;
    notify.alertBody = eventInfo;
    notify.applicationIconBadgeNumber = 1;
    notify.soundName = UILocalNotificationDefaultSoundName;
    
    [[UIApplication sharedApplication] scheduleLocalNotification:notify];
}

// this method is responsible for closing the keyboard (button 'DONE')
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if ([textField isEqual:self.textField]) {
        if ([self.textField.text length] != 0) { // user can't write an empty note
            [self.textField resignFirstResponder];
            self.buttonSave.userInteractionEnabled = YES;
        } else {
            [self showAlertWithMerssage:@"Enter text in text field."];
        }
    }
    
    return NO;
}

- (void)showAlertWithMerssage:(NSString *)message {
    /*
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Attention!!!"
                                                    message:message
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil, nil];
    */
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Attention!!!"
                                                                   message:message
                                                            preferredStyle:UIAlertControllerStyleAlert];
    

    UIAlertAction* yesButton = [UIAlertAction actionWithTitle:@"OK"
                                                        style:UIAlertActionStyleDefault
                                                      handler:^(UIAlertAction * action) {
                                                          //Handel your yes please button action here
                                                          [alert dismissViewControllerAnimated:YES completion:nil];
                                                      }];
//
//    UIAlertAction* noButton = [UIAlertAction actionWithTitle:@"No, thanks"
//                                                       style:UIAlertActionStyleDefault
//                                                     handler:^(UIAlertAction * action) {
//                                                        [alert dismissViewControllerAnimated:YES completion:nil];
//                                   
//                                                     }];
//    
    [alert addAction:yesButton];
//    [alert addAction:noButton];
    
    [self presentViewController:alert animated:YES completion:nil];
}

/*
 
 UIAlertController * alert=   [UIAlertController alertControllerWithTitle:@"Title"
                                                                  message:@"Message"
                                                           preferredStyle:UIAlertControllerStyleAlert];
 
 UIAlertAction* yesButton = [UIAlertAction actionWithTitle:@"Yes, please"
                                                     style:UIAlertActionStyleDefault
                                                   handler:^(UIAlertAction * action)
                                                   {
                                                   //Handel your yes please button action here
                                                   [alert dismissViewControllerAnimated:YES completion:nil];
 
                                                }];
 UIAlertAction* noButton = [UIAlertAction actionWithTitle:@"No, thanks"
                                                    style:UIAlertActionStyleDefault
                                                  handler:^(UIAlertAction * action)
                                                  {
                                                   [alert dismissViewControllerAnimated:YES completion:nil];
                                                 
                                                }];
 
 [alert addAction:yesButton];
 [alert addAction:noButton];
 
 [self presentViewController:alert animated:YES completion:nil];
 
 */

@end
