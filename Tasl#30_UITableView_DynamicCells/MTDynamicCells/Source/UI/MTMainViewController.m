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
@property (nonatomic, strong)   NSArray         *objects;
@property (nonatomic, strong)   NSArray         *objectsCustom;
@property (nonatomic, strong)   NSMutableArray  *arrayAllStudents;

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

    self.objectsCustom = [MTCustomClass arrayWithObjects];
    
    MTStudent *std = [MTStudent new];
    self.objects = [std sortedArrayWithName];
    
    [self sortedArrayWithArray];
    
    self.tableView.editing = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    //return 1;
    
    // level superman:
    return self.arrayAllStudents.count + 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSUInteger count = 0;
    if (section > 2) {
        return self.objectsCustom.count;
    } else {
        NSArray *studentsRating =[self.arrayAllStudents objectAtIndex:section];
        count = studentsRating.count;
    }
    
    return count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *indetifier = indexPath.section < 3 ? @"cell": @"customCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indetifier];
    
    if (!cell) {
        // level student:
        //cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indetifier];
        
        // level master:
        //cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:indetifier];
        
        // lewel mission inpossible!!!
        cell = indexPath.section < 3
        ? [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:indetifier]
        : [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indetifier];
    }

    if (indexPath.section < 3) {
        [self settingCell:cell cellForRowAtIndexPath:indexPath];
    } else {
        [self settingCellCustom:cell cellForRowAtIndexPath:indexPath];
    }
    
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSString *string;
    if (section == 0) {
        string = [NSString stringWithFormat:@"BEST STUDENTS"];
    } else if (section == 1){
        string = [NSString stringWithFormat:@"MIDDLE STUDENTS"];
    } else if (section == 2) {
        string = [NSString stringWithFormat:@"POOR STUDENTS"];
    } else if (section == 3) {
        string = [NSString stringWithFormat:@"CUSTOM CLASS"];
    }

    return string;
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    
    MTStudent *sourceStudent = [self.arrayAllStudents objectAtIndex:sourceIndexPath.row];
    
    NSMutableArray *tempArray = [NSMutableArray arrayWithArray:self.arrayAllStudents];
    
    if (sourceIndexPath.section == destinationIndexPath.section) {
        [tempArray removeObject:sourceStudent];
        [tempArray insertObject:sourceStudent atIndex:destinationIndexPath.row];
        self.arrayAllStudents = tempArray;
    } else {
        [tempArray removeObject:sourceStudent];
        self.arrayAllStudents = tempArray;
        
        MTStudent *destinationStudent = [self.arrayAllStudents objectAtIndex:destinationIndexPath.row];
        [tempArray insertObject:destinationStudent atIndex:destinationIndexPath.row];
        self.arrayAllStudents = tempArray;
    }
}


#pragma mark -
#pragma mark Private

- (void)sortedArrayWithArray {
    
    NSMutableArray *arrayGreen = [NSMutableArray array];
    NSMutableArray *arrayYellow = [NSMutableArray array];
    NSMutableArray *arrayRed = [NSMutableArray array];

    for (MTStudent *student in self.objects) {
        CGFloat averageRating = student.valueAverageRating;
        if (averageRating < 5.f) {
            [arrayRed addObject:student];
        } else if (averageRating >= 5.f && averageRating <= 8.f) {
            [arrayYellow addObject:student];
        } else {
            [arrayGreen addObject:student];
        }
    }
    
    self.arrayAllStudents = [NSMutableArray arrayWithObjects:arrayGreen, arrayYellow, arrayRed,  nil];
}

// level master
- (void)settingCell:(UITableViewCell *)cell cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSArray *array  = [self.arrayAllStudents objectAtIndex:indexPath.section];
    MTStudent *student = [array objectAtIndex:indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@ %@", student.name, student.surname];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%.1f", student.valueAverageRating];
    
    // condition for backgroundColor of cell
    
    CGFloat averageRating = student.valueAverageRating;
    if (averageRating < 5.f) {
        cell.backgroundColor = [UIColor redColor];
    } else if (averageRating >= 5.f && averageRating <= 8.f) {
        cell.backgroundColor = [UIColor yellowColor];
    } else {
        cell.backgroundColor = [UIColor greenColor];
    }
}

///*
// level student
- (void)settingCellCustom:(UITableViewCell *)cell cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MTCustomClass *object = [self.objectsCustom objectAtIndex:indexPath.row];
    cell.textLabel.text = object.name;
    cell.backgroundColor = object.color;
}
 //*/

// level pupil:
/*
- (void)settingCellCustom:(UITableViewCell *)cell cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat red = [UIColor getRed];
    CGFloat green = [UIColor getGreen];
    CGFloat blue = [UIColor getBlue];
    
    UIFont *font = [UIFont systemFontOfSize:12];
    cell.textLabel.font = font;
    cell.textLabel.shadowColor = [UIColor whiteColor];
    cell.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1];
    cell.textLabel.text = [NSString stringWithFormat:@"RGB {%.1f, %.1f, %.1f}",red * 255, green* 255, blue* 255];
}
 */

@end
