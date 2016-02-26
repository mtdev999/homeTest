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

#import "UITableView+MTExtensions.h"

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
    [self setupNavigationItem];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark Actions

- (void)actionEditButton:(UIButton *)sender {
    BOOL isEditing = self.tableView.editing;
    [self.tableView setEditing:!isEditing animated:YES];
    
    UIBarButtonSystemItem item = UIBarButtonSystemItemEdit;
    if (self.tableView.editing) {
        item = UIBarButtonSystemItemDone;
    }
    
    UIBarButtonItem *editButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:item
                                                                                target:self
                                                                                action:@selector(actionEditButton:)];
    self.navigationItem.rightBarButtonItem = editButton;
    
}

- (void)actionAddButton:(UIButton *)sender {
    if (!self.tableView.editing) {
        NSDate *date = [NSDate date];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"EEEE, d"];

        MTDay *day = [[MTDay alloc] init];
        day.name = [NSString stringWithFormat:@"  #%lu   %@", self.mutableDays.count + 1, [dateFormatter stringFromDate:date]];
        
        NSUInteger newDayIndex = 0;
        [self.mutableDays insertObject:day atIndex:newDayIndex];
        NSIndexSet *set = [NSIndexSet indexSetWithIndex:newDayIndex];
        
        [self.tableView beginUpdates];
        [self.tableView insertSections:set withRowAnimation:UITableViewRowAnimationLeft];
        [self.tableView endUpdates];
        
        [[UIApplication sharedApplication] beginIgnoringInteractionEvents];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [[UIApplication sharedApplication] endIgnoringInteractionEvents];
        });
    } 
}

#pragma mark -
#pragma mark UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.mutableDays.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [[self.mutableDays objectAtIndex:section] name];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    MTDay *day = [self.mutableDays objectAtIndex:section];
    
    return day.timeCells.count + 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        static NSString *addNewCellIdentifier = @"addCell";
        UITableViewCell *cell = [tableView dequeueCellWithStyle:UITableViewCellStyleDefault identifier:addNewCellIdentifier];
        cell.textLabel.textColor = [UIColor lightGrayColor];
        cell.textLabel.text = @"add new task";
        
        return cell;
    } else {
        static NSString *identifier = @"cell";
        
        UITableViewCell *cell = [tableView dequeueCellWithStyle:UITableViewCellStyleSubtitle identifier:identifier];
        
        MTDay *day = [self.mutableDays objectAtIndex:indexPath.section];
        MTTimeCell *timeCell = [day.timeCells objectAtIndex:indexPath.row - 1];
        
        cell.textLabel.text = [NSString stringWithFormat:@"%@", timeCell.name];
        cell.detailTextLabel.textColor = [UIColor colorWithWhite:0 alpha:0.7];
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", timeCell.taskTime];
        
        return cell;
    }
}

#pragma mark -
#pragma mark Remove Cells

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        MTDay *day = [self.mutableDays objectAtIndex:indexPath.section];
        MTTimeCell *timeCell = [day.timeCells objectAtIndex:indexPath.row - 1];
        
        NSMutableArray *tempArray = [NSMutableArray arrayWithArray:day.timeCells];
        
        [tempArray removeObject:timeCell];
        day.timeCells = tempArray;
        
        [tableView beginUpdates];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationRight];
        [tableView endUpdates];
    }
}

#pragma mark -
#pragma mark Moving cells

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return indexPath.row > 0;
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    MTDay *sourceDay = [self.mutableDays objectAtIndex:sourceIndexPath.section];
    MTTimeCell *timeCell = [sourceDay.timeCells objectAtIndex:sourceIndexPath.row - 1];
    
    NSMutableArray *tempArray = [NSMutableArray arrayWithArray:sourceDay.timeCells];

    if (sourceIndexPath.section == destinationIndexPath.section) {
        
        [tempArray removeObjectAtIndex:sourceIndexPath.row - 1];
        [tempArray insertObject:timeCell atIndex:destinationIndexPath.row - 1];
        
        sourceDay.timeCells = tempArray;
    } else {
        [tempArray removeObject:timeCell];
        sourceDay.timeCells = tempArray;
        
        MTDay *destinationDay = [self.mutableDays objectAtIndex:destinationIndexPath.section];
        tempArray = [NSMutableArray arrayWithArray:destinationDay.timeCells];
        [tempArray insertObject:timeCell atIndex:destinationIndexPath.row - 1];
        destinationDay.timeCells = tempArray;
    }
}

#pragma mark -
#pragma mark UITableViewDelegate

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    CGRect frame = CGRectMake(0, 0,
                              CGRectGetWidth([tableView rectForHeaderInSection:section]),
                              CGRectGetHeight([tableView rectForHeaderInSection:section]));
    
    UIView *headerView = [[UIView alloc] initWithFrame:frame];
    headerView.backgroundColor = [UIColor colorWithRed:0.2392 green:0.8471 blue:0.298 alpha:1];
    
    UILabel *headerLabel = [[UILabel alloc] initWithFrame:frame];
    headerLabel.text = [[self.mutableDays objectAtIndex:section] name];
    
    [headerView addSubview:headerLabel];
    return headerView;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    CGRect frame = CGRectMake(0, 0,
                              CGRectGetWidth([tableView rectForFooterInSection:section]),
                              CGRectGetHeight([tableView rectForFooterInSection:section]));
    
    UIView *footerView = [[UIView alloc] initWithFrame:frame];
    footerView.backgroundColor = [UIColor colorWithRed:0.2392 green:0.8471 blue:0.298 alpha:0.5];
    
    UILabel *footerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0,
                                                                     CGRectGetWidth([tableView rectForFooterInSection:section]) - 20,
                                                                     CGRectGetHeight([tableView rectForFooterInSection:section]))];
    footerLabel.text = @"";
    footerLabel.textAlignment = NSTextAlignmentRight;
    
    [footerView addSubview:footerLabel];
    return footerView;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    /*
    cell.center = CGPointMake(CGRectGetMidX(cell.frame) - 30, CGRectGetMidY(cell.frame));
    cell.backgroundColor = [UIColor colorWithRed:0.9633 green:0.9143 blue:0.7117 alpha:0.8];
    cell.textLabel.textColor = [UIColor colorWithWhite:0 alpha:0];
    
    [UIView beginAnimations:@"Move" context:nil];
    [UIView setAnimationDuration:0.2f];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDelegate:self];
    
    cell.center = CGPointMake(CGRectGetMidX(cell.frame) + 30, CGRectGetMidY(cell.frame));
    cell.backgroundColor = [UIColor whiteColor];
    cell.textLabel.textColor = [UIColor colorWithWhite:0 alpha:0.8];
    
    [UIView commitAnimations];
     */
    
   // /*
    cell.frame = CGRectMake(0 - CGRectGetWidth(cell.frame)/2,
                            CGRectGetMinY(cell.frame),
                            CGRectGetWidth(cell.frame),
                            CGRectGetHeight(cell.frame));
    
    [UIView animateWithDuration:0.2
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         cell.frame = CGRectMake(0, CGRectGetMinY(cell.frame),
                                                 CGRectGetWidth(cell.frame),
                                                 CGRectGetHeight(cell.frame));
                         cell.backgroundColor = [UIColor colorWithRed:0.5538 green:0.9583 blue:0.5388
                                                                alpha:0.5];
                     }
                     completion:^(BOOL finished) {
                         [UIView animateWithDuration:0.2 animations:^{
                             cell.backgroundColor = [UIColor whiteColor];
                         }];
                     }];
    // */
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row == 0) {
        MTDay *day = [self.mutableDays objectAtIndex:indexPath.section];
        
        NSMutableArray *tempArray = nil;
        
        if (day.timeCells) {
            tempArray = [NSMutableArray arrayWithArray:day.timeCells];
        } else {
            tempArray = [NSMutableArray array];
        }
        
        NSUInteger newUserIndex = 0;
        
        [tempArray insertObject:[MTTimeCell timeCell] atIndex:newUserIndex];
        day.timeCells  = tempArray;
        
        NSIndexPath *newIndexPath = [NSIndexPath indexPathForItem:newUserIndex + 1 inSection:indexPath.section];
        
        [self.tableView beginUpdates];
        [self.tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationBottom];
        [self.tableView endUpdates];
        
        [[UIApplication sharedApplication] beginIgnoringInteractionEvents];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [[UIApplication sharedApplication] endIgnoringInteractionEvents];
        });
    }
    
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return indexPath.row == 0 ? UITableViewCellEditingStyleNone : UITableViewCellEditingStyleDelete; //| UITableViewCellEditingStyleInsert;
}

- (BOOL)tableView:(UITableView *)tableView shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}

- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    return @"Remove";
}

- (NSIndexPath *)                   tableView:(UITableView *)tableView
     targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath *)sourceIndexPath
                          toProposedIndexPath:(NSIndexPath *)proposedDestinationIndexPath
{
    if (proposedDestinationIndexPath.row == 0) {
        return sourceIndexPath;
    } else {
        return proposedDestinationIndexPath;
    }
}

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
    //self.tableView.editing = NO;
}

- (void)createDay {
    self.mutableDays = [NSMutableArray array];
    /*
    for (int i = 0; i < 1; i++) {
        MTDay *day = [[MTDay alloc] init];
        day.name = [NSString stringWithFormat:@"  Day #%d", i];
        
        NSMutableArray *array = [NSMutableArray array];
        for (int j = 0; j < 100; j++) {
            [array addObject:[MTTimeCell timeCell]];
        }
        
        day.timeCells = array;
        [self.mutableDays addObject:day];
    }
     */
}

- (void)setupNavigationItem {
    self.navigationItem.title = @"Tasks List";
    
    UIBarButtonItem *editButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit
                                                                                target:self
                                                                                action:@selector(actionEditButton:)];
    self.navigationItem.rightBarButtonItem = editButton;
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                                target:self
                                                                                action:@selector(actionAddButton:)];
    self.navigationItem.leftBarButtonItem = addButton;
}

@end
