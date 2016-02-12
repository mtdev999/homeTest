//
//  ViewController.h
//  MTControls
//
//  Created by Mark Tezza on 11.02.16.
//  Copyright © 2016 Mark Tezza. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *valueSliderLabel;
@property (strong, nonatomic) IBOutlet UIView *testView;
@property (strong, nonatomic) IBOutlet UIView *squareFirstView;
@property (strong, nonatomic) IBOutlet UIView *squareSecondView;
@property (strong, nonatomic) IBOutlet UIView *squareThridView;

@property (strong, nonatomic) IBOutlet UISwitch *rotationSwitch;
@property (strong, nonatomic) IBOutlet UISwitch *scaleSwitch;
@property (strong, nonatomic) IBOutlet UISwitch *translationSwitch;

@property (strong, nonatomic) IBOutlet UISegmentedControl *segmentControl;
@property (strong, nonatomic) IBOutlet UISlider *valueSlider;

- (IBAction)actionSegment:(UISegmentedControl *)sender;
- (IBAction)actionSlider:(UISlider *)sender;
- (IBAction)actionSwitch:(UISwitch *)sender;

@end

