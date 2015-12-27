//
//  ViewController.m
//  ToDoList
//
//  Created by Mark Tezza on 27.12.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property (nonatomic, strong)   IBOutlet UITextField    *textField;
@property (nonatomic, strong)   IBOutlet UIDatePicker   *datePicker;
@property (nonatomic, strong)   IBOutlet UIButton       *buttonSave;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark Private

- (void)saveButton {
    NSLog(@"save");
}



@end
