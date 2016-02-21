//
//  StaticCellsTableViewController.h
//  StaticTableCells
//
//  Created by Mark Tezza on 19.02.16.
//  Copyright © 2016 Mark Tezza. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StaticCellsTableViewController : UITableViewController <UITableViewDataSource>
@property (nonatomic, strong) IBOutlet UITableView          *tableViewController;
@property (strong, nonatomic) IBOutlet UISlider             *soundComponentSlider;
@property (strong, nonatomic) IBOutlet UISlider             *musicComponentSlider;
@property (strong, nonatomic) IBOutlet UILabel              *maxLevelSoundLabel;
@property (strong, nonatomic) IBOutlet UISegmentedControl   *segmentControl;

@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *textLabels;

- (IBAction)actionSoundSlider:(UISlider *)sender;
- (IBAction)actionSegment:(UISegmentedControl *)sender;
- (IBAction)actionEnableSwitch:(UISwitch *)sender;

@end
