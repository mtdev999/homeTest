//
//  ViewController.m
//  MTTextFieldHomeTask
//
//  Created by Mark Tezza on 14.02.16.
//  Copyright © 2016 Mark Tezza. All rights reserved.
//

#import "ViewController.h"

static NSUInteger const kMTLocalCodeMaxLength = 7;
static NSUInteger const kMTAreaCodeMaxLength = 3;
static NSUInteger const kMTCountryCodeMaxLength = 2;
static NSUInteger const kMTEmailSymbolsMaxLength = 54;

typedef NS_ENUM(NSUInteger, MTTextFields) {
    MTTextFieldsName,
    MTTextFieldsSurname,
    MTTextFieldsLogin,
    MTTextFieldsPassword,
    MTTextFieldsAge,
    MTTextFieldsNumberPhone,
    MTTextFieldsEmail
};

@interface ViewController ()
@property (nonatomic, assign, getter=isSymbolAt) BOOL  symbolAt;
@property (nonatomic, assign)       NSUInteger locationAt;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark Actions

- (IBAction)actionChangeText:(UITextField *)sender {
    for (UILabel *object in self.infoLabels) {
        if (object.tag == sender.tag) {
            object.text = sender.text;
        }
    }
}

- (IBAction)actionClearAll:(UIButton *)sender {
    for (UITextField *object in self.textFieldsCollection) {
        object.text = nil;
    }
    for (UILabel *object in self.infoLabels) {
        object.text = nil;
    }
}

#pragma mark -
#pragma mark UITextFieldDelegate

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    if (textField.tag == MTTextFieldsEmail ) {
        NSRange range = [textField.text rangeOfString:@"."];
        if (range.location == NSNotFound) {
            return NO;
        } else if (!self.isSymbolAt){
            return NO;
        } else if (textField.text.length - 1 == range.location) {
            return NO;
        }
    }
    
    return YES;
}

- (BOOL)textFieldShouldClear:(UITextField *)textField {
    self.symbolAt = NO;
    
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField.tag < MTTextFieldsEmail) {
        UITextField *tempTextField = [self.textFieldsCollection objectAtIndex:textField.tag +1];
        [tempTextField becomeFirstResponder];
    } else {
        [textField resignFirstResponder];
    }

    return YES;
}

- (BOOL)                textField:(UITextField *)textField
    shouldChangeCharactersInRange:(NSRange)range
                replacementString:(NSString *)string
{
    BOOL result = YES;
    
    if (textField.tag == MTTextFieldsAge) {
        result = [self ageTextField:textField inRange:range replacementString:string];
    }
    
    if (textField.tag == MTTextFieldsNumberPhone) {
        result = [self phoneNumberTextField:textField inRange:range replacementString:string];
    }
    
    if (textField.tag == MTTextFieldsEmail) {
        result = [self emailTextField:textField inRange:range replacementString:string];
    }
    
    return result;
}

#pragma mark -
#pragma mark Methods for UITextFieldDelegate

- (BOOL)emailTextField:(UITextField *)textField
             inRange:(NSRange)range
   replacementString:(NSString *)string
{
    NSMutableString *noValidSymbols = [[NSMutableString alloc] initWithString:@"±!§#$%^&*()_-+={}:;|?><, /:%\'"""];
    
    NSCharacterSet *validationSet = [NSCharacterSet characterSetWithCharactersInString:noValidSymbols];
    NSArray *components = [string componentsSeparatedByCharactersInSet:validationSet];
    
    if (components.count > 1) {
        return NO;
    }

    if (textField.text.length == 0 && [string isEqualToString:@"@"]) {
        return NO;
    } else if ([string isEqualToString:@"@"]  && !self.isSymbolAt ) {
        self.symbolAt = YES;
        self.locationAt = range.location;
    } else if ([string isEqualToString:@"@"] && self.isSymbolAt ) {
        return NO;
    }
    
    NSString *newString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    if (self.isSymbolAt && [string isEqualToString:@"."]) {
        NSRange rangeDat = [newString rangeOfString:@"."];
        if (self.locationAt + 1 == rangeDat.location) {
            return NO;
        }
    }
    
    return newString.length <= kMTEmailSymbolsMaxLength;
}

- (BOOL)ageTextField:(UITextField *)textField
             inRange:(NSRange)range
   replacementString:(NSString *)string
{
     // if your choose ’numbers and punctuation'
    NSCharacterSet *validationSet = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
    NSArray *components = [string componentsSeparatedByCharactersInSet:validationSet];
    
    if (components.count > 1) {
        return NO;
    }

    NSString *resultString = [textField.text stringByReplacingCharactersInRange:range withString:string];

    return resultString.length <= 2;
}

- (BOOL)phoneNumberTextField:(UITextField *)textField
                     inRange:(NSRange)range
           replacementString:(NSString *)string
{
    NSCharacterSet *validationSet = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
    NSArray *components = [string componentsSeparatedByCharactersInSet:validationSet];
    
    if (components.count > 1) {
        return NO;
    }
    
    NSString *newString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    NSArray *validComponets = [newString componentsSeparatedByCharactersInSet:validationSet];
    newString = [validComponets componentsJoinedByString:@""];
    
    if (newString.length > 12) {
        return NO;
    }
    
    NSMutableString *resultString = [self resultString:newString];
    textField.text = resultString;
    
    for (UILabel *object in self.infoLabels) {
        if (object.tag == MTTextFieldsNumberPhone) {
            object.text = textField.text;
        }
    }
    
    return NO;
}

- (NSMutableString *)resultString:(NSString *)newString {
    NSMutableString *resultString = [NSMutableString string];
    NSUInteger localNumberLength = MIN(newString.length, kMTLocalCodeMaxLength);
    
    if (localNumberLength > 0) {
        NSString *number = [newString substringFromIndex:newString.length - localNumberLength];
        [resultString appendString:number];
        
        if (resultString.length > 3) {
            [resultString insertString:@"-" atIndex:3];
        }
    }
    
    if (newString.length > kMTLocalCodeMaxLength) {
        NSInteger areaCodeLength = MIN(newString.length - kMTLocalCodeMaxLength, kMTAreaCodeMaxLength);
        
        NSRange areaRange = NSMakeRange(newString.length - kMTLocalCodeMaxLength - areaCodeLength, areaCodeLength);
        NSString *area = [newString substringWithRange:areaRange];
        
        area = [NSString stringWithFormat:@"(%@) ", area];
        [resultString insertString:area atIndex:0];
    }
    
    if (newString.length > kMTLocalCodeMaxLength + kMTAreaCodeMaxLength) {
        NSInteger countryCodeLength = MIN(newString.length - kMTLocalCodeMaxLength - kMTAreaCodeMaxLength, kMTCountryCodeMaxLength);
        
        NSRange countryRange = NSMakeRange(0, countryCodeLength);
        NSString *country = [newString substringWithRange:countryRange];
        
        country = [NSString stringWithFormat:@"+%@ ", country];
        [resultString insertString:country atIndex:0];
    }
    
    return resultString;
}

@end
