//
//  MTMainViewController.m
//  MTDynamicCells
//
//  Created by Mark Tezza on 18.02.16.
//  Copyright © 2016 Mark Tezza. All rights reserved.
//

#import "MTMainViewController.h"

#import "MTMainView.h"
#import "MTCustomClass.h"
#import "MTStudent.h"

#import "MTRamdomValues.h"
#import "UIColor+MTExtension.h"

@interface MTMainViewController ()
@property (nonatomic, strong)   MTMainView      *mainView;
@property (nonatomic, strong)   NSMutableArray  *objects;

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

- (void)viewDidLoad {
    [super viewDidLoad];

    //self.objects = [MTCustomClass arrayWithObjects];
    self.objects = [MTStudent arrayWithStudents];
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
    return self.objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *indetifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indetifier];
    
    if (!cell) {
        //cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indetifier];
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:indetifier];
    }

    [self settingCell:cell cellForRowAtIndexPath:indexPath];
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSString *result;
    if (section == 0) {
        result = [NSString stringWithFormat:@"COLORS Part ONE"];
    } else {
        result = [NSString stringWithFormat:@"COLORS Part TWO"];
    }

    return result;
}

#pragma mark -
#pragma mark Private

- (void)settingCell:(UITableViewCell *)cell cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MTStudent *student = [self.objects objectAtIndex:indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@ %@", student.name, student.surname];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%f", student.averageRating];
}

/*
// level student
- (void)settingCell:(UITableViewCell *)cell cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MTCustomClass *object = [self.objects objectAtIndex:indexPath.row];
    cell.textLabel.text = object.name;
    cell.backgroundColor = object.color;
}
 */

// level pupil:
/*
- (void)settingCell:(UITableViewCell *)cell cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat red = [UIColor getRed];
    CGFloat green = [UIColor getGreen];
    CGFloat blue = [UIColor getBlue];
    
    UIFont *font = [UIFont systemFontOfSize:12];
    cell.textLabel.font = font;
    cell.textLabel.shadowColor = [UIColor whiteColor];
    cell.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1];
    cell.textLabel.text = [NSString stringWithFormat:@"Number cell: %lu", indexPath.row];
}
 */

@end
