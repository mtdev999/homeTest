//
//  MTMainViewController.m
//  MTTableViewEditing
//
//  Created by Mark Tezza on 21.02.16.
//  Copyright © 2016 Mark Tezza. All rights reserved.
//

#import "MTMainViewController.h"

#import "MTMainView.h"
#import "MTDay.h"
#import "MTTimeCell.h"

@interface MTMainViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong)   MTMainView      *mainView;
@property (nonatomic, strong)   UITableView     *tableView;
@property (nonatomic, strong)   NSMutableArray  *mutableDays;

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
    
    [self createCustomTableView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createDay];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.mutableDays.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [NSString stringWithFormat:@"Day #%lu", section];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    MTDay *day = [self.mutableDays objectAtIndex:section];
    
    return day.timeCells.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identifier = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
    }
    
    MTDay *day = [self.mutableDays objectAtIndex:indexPath.section];
    MTTimeCell *timeCell = [day.timeCells objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@", timeCell.name];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%lu", timeCell.numberTask];
    
    return cell;
}

#pragma mark -
#pragma mark Moving cells

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    MTDay *sourceDay = [self.mutableDays objectAtIndex:sourceIndexPath.section];
    MTTimeCell *timeCell = [sourceDay.timeCells objectAtIndex:sourceIndexPath.row];
    
    NSMutableArray *tempArray = [NSMutableArray arrayWithArray:sourceDay.timeCells];

    if (sourceIndexPath.section == destinationIndexPath.section) {
        
        [tempArray removeObjectAtIndex:sourceIndexPath.row];
        [tempArray insertObject:timeCell atIndex:destinationIndexPath.row];
        
        sourceDay.timeCells = tempArray;
    } else {
        [tempArray removeObject:timeCell];
        sourceDay.timeCells = tempArray;
        
        MTDay *destinationDay = [self.mutableDays objectAtIndex:destinationIndexPath.section];
        tempArray = [NSMutableArray arrayWithArray:destinationDay.timeCells];
        [tempArray insertObject:timeCell atIndex:destinationIndexPath.row];
        destinationDay.timeCells = tempArray;
    }
}


#pragma mark -
#pragma mark UITableViewDelegate

#pragma mark -
#pragma mark Private

- (void)createCustomTableView {
    CGRect frame = self.view.bounds;
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStyleGrouped];
    tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    tableView.delegate = self;
    tableView.dataSource = self;
    
    [self.view addSubview:tableView];
    
    self.tableView = tableView;
    self.tableView.editing = YES;
}

- (void)createDay {
    self.mutableDays = [NSMutableArray array];
    
    for (int i = 0; i < 3; i++) {
        MTDay *day = [[MTDay alloc] init];
        day.name = [NSString stringWithFormat:@"Day #%d", i];
        
        NSMutableArray *array = [NSMutableArray array];
        for (int j = 1; j <= 8; j++) {
            [array addObject:[MTTimeCell timeCellWithIndex:j]];
        }
        
        day.timeCells = array;
        [self.mutableDays addObject:day];
    }
}

@end
