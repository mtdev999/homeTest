//
//  ViewController.m
//  ToDoList
//
//  Created by Mark Tezza on 28.12.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property (strong, nonatomic) IBOutlet UITextField      *textField;
@property (strong, nonatomic) IBOutlet UIDatePicker     *datePicker;
@property (strong, nonatomic) IBOutlet UIButton         *buttonSave;


@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.buttonSave addTarget:self action:@selector(save) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)save {
    NSLog(@"save");
}
@end
