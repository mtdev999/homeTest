//
//  MTMainViewController.m
//  MTTableViewEditing
//
//  Created by Mark Tezza on 21.02.16.
//  Copyright © 2016 Mark Tezza. All rights reserved.
//

#import "MTMainViewController.h"

#import "MTMainView.h"

@interface MTMainViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong)   MTMainView  *mainView;
@property (nonatomic, strong)   UITableView       *tableView;

@end

@implementation MTMainViewController
@dynamic mainView;

#pragma mark -
#pragma mark Accessors

- (MTMainView *)mainView {
    if ([self isViewLoaded] && [self.view isKindOfClass:[MTMainView class]]) {
        return (MTMainView *)self.view;
    }
    
    return nil;
}

#pragma mark -
#pragma mark Life Cycle

- (void)loadView {
    [super loadView];
    
    CGRect frame  = CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds));
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStyleGrouped];
    
    tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    tableView.delegate = self;
    tableView.dataSource = self;
    
    [self.view addSubview:tableView];
    
    self.tableView = tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identifier = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
    }
    
    cell.textLabel.text = @"New Row";
    cell.detailTextLabel.text = @"#__";
    
    return cell;
    
}


#pragma mark -
#pragma mark UITableViewDelegate



@end
