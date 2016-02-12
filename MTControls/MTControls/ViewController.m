//
//  ViewController.m
//  MTControls
//
//  Created by Mark Tezza on 11.02.16.
//  Copyright © 2016 Mark Tezza. All rights reserved.
//

#import "ViewController.h"

typedef enum {
    MTSegmentTypeFirst = 0,
    MTSegmentTypeSecond,
    MTSegmentTypeThrid
} MTSegmentType;

@interface ViewController ()
@property (nonatomic, assign)   MTSegmentType   segmentValue;
@property (nonatomic, strong)   NSMutableArray  *mutableViews;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableArray *array = [NSMutableArray array];
    [array addObject:self.squareFirstView];
    [array addObject:self.squareSecondView];
    [array addObject:self.squareThridView];
    
    self.mutableViews = array;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)actionSegment:(UISegmentedControl *)sender {
    switch (self.segmentControl.selectedSegmentIndex) {
        case MTSegmentTypeFirst:
            self.squareFirstView.hidden = NO;
            
            self.squareSecondView.hidden = YES;
            self.squareThridView.hidden = YES;
            break;
            
        case MTSegmentTypeSecond:
            self.squareSecondView.hidden = NO;
            
            self.squareFirstView.hidden = YES;
            self.squareThridView.hidden = YES;
            break;
            
        case MTSegmentTypeThrid:
            self.squareThridView.hidden = NO;
            
            self.squareFirstView.hidden = YES;
            self.squareSecondView.hidden = YES;
            break;
            
        default:
            break;
    }
}

- (IBAction)actionSlider:(UISlider *)sender {
    self.valueSliderLabel.text = [NSString stringWithFormat:@"%1.2f", self.valueSlider.value];
    if (self.rotationSwitch.enabled == YES) {
        [self performSelector:@selector(animationAllViews:) withObject:nil];
    }
}

- (IBAction)actionSwitch:(UISwitch *)sender {
   [self animationAllViews:sender];
}

- (void)animationAllViews:(UISwitch *)sender {
    for (UIView *object in self.mutableViews) {
        switch (sender.tag) {
            case 10:
                [self performSelector:@selector(rotationView:sender:) withObject:object withObject:sender];
                break;
            case 11:
                [self performSelector:@selector(scaleView:sender:) withObject:object withObject:sender];
                break;
            case 12:
                [self performSelector:@selector(translationView:sender:) withObject:object withObject:sender];
                break;
                
            default:
                break;
        }
    }
}

#pragma mark -
#pragma mark Animation

- (void)rotationView:(UIView *)view sender:(UISwitch *)seneder {
    CABasicAnimation *rotationAnimation;
    if (seneder.isOn) {
        rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
        rotationAnimation.duration = self.valueSlider.value;
        rotationAnimation.repeatCount = HUGE_VALF;
        rotationAnimation.toValue = [NSNumber numberWithFloat:M_PI*2];
        [view.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
    } else {
        [view.layer removeAnimationForKey:@"rotationAnimation"];
    }
}

- (void)scaleView:(UIView *)view sender:(UISwitch *)sender {
    CABasicAnimation *scaleAnimation;
    if (sender.isOn) {
        scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        scaleAnimation.duration = self.valueSlider.value;
        scaleAnimation.repeatCount = HUGE_VALF;
        scaleAnimation.autoreverses = YES;
        scaleAnimation.fromValue = [NSNumber numberWithFloat:1.0];
        scaleAnimation.toValue = [NSNumber numberWithFloat:0.5];
        [view.layer addAnimation:scaleAnimation forKey:@"scaleAnimation"];
    } else {
        [view.layer removeAnimationForKey:@"scaleAnimation"];
    }
}

- (void)translationView:(UIView *)view sender:(UISwitch *)sender {
    
    CGRect rect = self.testView.frame;
    
    rect = CGRectInset(rect, CGRectGetWidth(view.frame), CGRectGetHeight(view.frame));
    

    CGFloat x = arc4random() % (int)CGRectGetWidth(rect) + CGRectGetMinX(rect);
    CGFloat y = arc4random() % (int)CGRectGetHeight(rect) + CGRectGetMinY(rect);
    
    CGPoint startPoint = CGPointMake(x, y);
    CGPoint endPoint = CGPointMake(y, x);
    
    if (sender.isOn) {
        CABasicAnimation * baseAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
        baseAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        baseAnimation.fromValue = [NSValue valueWithCGPoint:startPoint];
        baseAnimation.toValue = [NSValue valueWithCGPoint:endPoint];
        baseAnimation.duration = 1.f;
        
        CABasicAnimation * boundsAnimation = [CABasicAnimation animationWithKeyPath:@"bounds"];
        boundsAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        boundsAnimation.fromValue = [NSValue valueWithCGPoint:startPoint];
        boundsAnimation.toValue = [NSValue valueWithCGPoint:endPoint];
        boundsAnimation.duration = 1.f;
        
        CAAnimationGroup * group =[CAAnimationGroup animation];
        group.animations =[NSArray arrayWithObjects:baseAnimation, boundsAnimation, nil];
        group.duration = 1.f;
        group.autoreverses = YES;
        group.repeatCount = HUGE_VAL;
        
        [view.layer addAnimation:group forKey:@"frame"];
    } else {
        [view.layer removeAnimationForKey:@"frame"];
    }
}

@end
