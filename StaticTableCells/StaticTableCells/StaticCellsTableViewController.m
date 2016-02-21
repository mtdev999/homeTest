//
//  StaticCellsTableViewController.m
//  StaticTableCells
//
//  Created by Mark Tezza on 19.02.16.
//  Copyright © 2016 Mark Tezza. All rights reserved.
//

#import "StaticCellsTableViewController.h"

#define UITrackTintColorDefaults [UIColor colorWithRed:0.5 green:0.5 blue:0.3 alpha:1]

static CGFloat const kMTValueEqualOne = 1;

@implementation StaticCellsTableViewController

#pragma mark -
#pragma mark Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.maxLevelSoundLabel.textColor = [UIColor whiteColor];
    
    self.soundComponentSlider.minimumTrackTintColor =
    self.musicComponentSlider.minimumTrackTintColor =
    UITrackTintColorDefaults;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark Actions

- (IBAction)actionSoundSlider:(UISlider *)sender {
    [self refreshScreenWithSenderTag:sender.tag];
}

- (IBAction)actionSegment:(UISegmentedControl *)sender {
    [self changeCellsColorText:sender.selectedSegmentIndex];
}

- (IBAction)actionEnableSwitch:(UISwitch *)sender {
    sender.isOn == YES
    ? (self.soundComponentSlider.enabled = self.musicComponentSlider.enabled = NO)
    : (self.soundComponentSlider.enabled = self.musicComponentSlider.enabled = YES);
}

#pragma mark -
#pragma mark Private

- (void)refreshScreenWithSenderTag:(NSUInteger)tag {
    UISlider *soundSlider = self.soundComponentSlider;
    UISlider *musicSlider = self.musicComponentSlider;
    UILabel *maxLevelSoundLabel = self.maxLevelSoundLabel;
    
    maxLevelSoundLabel.textColor = [UIColor whiteColor];

    if (tag == 0) {
        [self changeTextColorSubtitle:soundSlider.value];
        soundSlider.minimumTrackTintColor = [self trackTintColor:soundSlider.value];
    } else {
        musicSlider.minimumTrackTintColor = [self trackTintColor:musicSlider.value];;
    }
}

- (UIColor *)trackTintColor:(CGFloat)value {
    UIColor *color = nil;
    CGFloat green = kMTValueEqualOne;
    CGFloat red = CGFLOAT_MIN;
    
    color = [UIColor colorWithRed:red + value
                            green:green - value
                             blue:0
                            alpha:kMTValueEqualOne];
    
    return color;
}

- (void)changeTextColorSubtitle:(CGFloat)value {
    if (value > 0.8) {
        self.maxLevelSoundLabel.textColor = [UIColor redColor];
    }
}

- (void)changeCellsColorText:(NSUInteger)index {
    switch (index) {
        case 0:
            [self chachgeTintColor:[UIColor blackColor]];
            break;
            
        case 1:
            [self chachgeTintColor:[UIColor blueColor]];
            break;
            
        case 2:
            [self chachgeTintColor:[UIColor redColor]];
            break;
            
        case 3:
            [self chachgeTintColor:[UIColor greenColor]];
            break;
        
        default:
            break;
    }
}

- (void)chachgeTintColor:(UIColor *)color {
    for (UILabel *object in self.textLabels) {
        object.textColor = color;
    }
    
    self.segmentControl.tintColor = color;
}

@end
