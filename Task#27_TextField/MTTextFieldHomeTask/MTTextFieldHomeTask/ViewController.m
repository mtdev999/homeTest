//
//  ViewController.m
//  MTTextFieldHomeTask
//
//  Created by Mark Tezza on 14.02.16.
//  Copyright © 2016 Mark Tezza. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.nameTextField becomeFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if ([textField isEqual:self.nameTextField]) {
        [self.surnameTextField becomeFirstResponder];
    } else if ([textField isEqual:self.surnameTextField]){
        [self.loginTextField becomeFirstResponder];
    } else if ([textField isEqual:self.loginTextField]){
        [self.passwordTextField becomeFirstResponder];
    } else if ([textField isEqual:self.passwordTextField]){
        [self.ageTextField becomeFirstResponder];
    } else if ([textField isEqual:self.ageTextField]){
        [self.numberPhoneTextField becomeFirstResponder];
    } else if ([textField isEqual:self.numberPhoneTextField]){
        [self.emailTextField becomeFirstResponder];
    } else {
        [textField resignFirstResponder];
    }
    
    return YES;
}

@end
