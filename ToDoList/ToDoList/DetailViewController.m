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
    NSLog(@"save");
}

// this method is responsible for closing the keyboard (button 'DONE')
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if ([textField isEqual:self.textField]) {
        [self.textField resignFirstResponder];
    }
    
    return YES;
}

@end
