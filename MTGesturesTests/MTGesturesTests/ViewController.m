//
//  ViewController.m
//  MTGesturesTests
//
//  Created by Mark Tezza on 14.01.16.
//  Copyright © 2016 Mark Tezza. All rights reserved.
//

#import "ViewController.h"

#import "UIColor+MTExtension.h"
#import "MTRamdomValues.h"

@interface ViewController () <UIGestureRecognizerDelegate>
@property (nonatomic, strong)   UIView *testView;
@property (nonatomic, assign)   CGFloat testViewScale;
@property (nonatomic, assign)   CGFloat testViewRotation;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // create view
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMidX(self.view.bounds) - 50,
                                                            CGRectGetMidY(self.view.bounds) - 50,
                                                            100, 100)];
    view.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin |
                            UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    
    view.backgroundColor = [UIColor greenColor];
    [self.view addSubview:view];
    self.testView = view;
    
    // one tap
    UITapGestureRecognizer *tapGesture =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(handleTap:)];
    [self.view addGestureRecognizer:tapGesture];
    
    // double tap
    UITapGestureRecognizer *doubleTapGesture =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(handleDoubleTap:)];
    doubleTapGesture.numberOfTapsRequired = 2; // двойное нажатие
    [self.view addGestureRecognizer:doubleTapGesture];
    // одиночный тап будет срабатывать с задержкой дабы не срабатывать при двойном клике
    [tapGesture requireGestureRecognizerToFail:doubleTapGesture];
    
    // double tap and double touch
    UITapGestureRecognizer *doubleTapDoubleTouchGesture =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(handleDoubleTapDoubleTouch:)];
    doubleTapDoubleTouchGesture.numberOfTapsRequired = 2;
    doubleTapDoubleTouchGesture.numberOfTouchesRequired = 2;
    [self.view addGestureRecognizer:doubleTapDoubleTouchGesture];
    
    // zoom
    UIPinchGestureRecognizer *pinchGesture = [[UIPinchGestureRecognizer alloc] initWithTarget:self
                                                                                       action:@selector(handlePinch:)];
    pinchGesture.delegate = self;
    [self.view addGestureRecognizer:pinchGesture];
    
    // rotation
    UIRotationGestureRecognizer *rotationGesture =
    [[UIRotationGestureRecognizer alloc] initWithTarget:self
                                                 action:@selector(handleRotation:)];
    rotationGesture.delegate = self;
    [self.view addGestureRecognizer:rotationGesture];
    
    // pan
    UIPanGestureRecognizer *panGesture =
    [[UIPanGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(handlePan:)];
    panGesture.delegate = self;
    [self.view addGestureRecognizer:panGesture];
    
    // swipe
    UISwipeGestureRecognizer *verticalSwipeGesture =
    [[UISwipeGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(handleVerticalSwipe:)];
    
    verticalSwipeGesture.direction = UISwipeGestureRecognizerDirectionDown | UISwipeGestureRecognizerDirectionUp;
    verticalSwipeGesture.delegate = self;
    [self.view addGestureRecognizer:verticalSwipeGesture];
    
    UISwipeGestureRecognizer *horizontalSwipeGesture =
    [[UISwipeGestureRecognizer alloc] initWithTarget:self
                                              action:@selector(handleHorizontalSwipe:)];
    
    horizontalSwipeGesture.direction = UISwipeGestureRecognizerDirectionRight | UISwipeGestureRecognizerDirectionLeft;
    horizontalSwipeGesture.delegate = self;
    [self.view addGestureRecognizer:horizontalSwipeGesture];
    
}

#pragma mark -
#pragma mark Gestures

- (void)handleTap:(UITapGestureRecognizer *)tapGesture  {
    [UIView animateWithDuration:0.3f
                     animations:^{
                         self.testView.backgroundColor = [UIColor randomColor];
                     }];
    NSLog(@"Tap: %@", NSStringFromCGPoint([tapGesture locationInView:self.view]));
}

- (void)handleDoubleTap:(UITapGestureRecognizer *)doubleTapGesture  {
    CGAffineTransform currentTransform = self.testView.transform;
    CGAffineTransform newTransform = CGAffineTransformScale(currentTransform, 1.2f, 1.2f);
    [UIView animateWithDuration:0.3f
                     animations:^{
                         self.testView.transform = newTransform;
                     }];
    self.testViewScale = 1.2f;
    NSLog(@"Double Tap: %@", NSStringFromCGPoint([doubleTapGesture locationInView:self.view]));
}

- (void)handleDoubleTapDoubleTouch:(UITapGestureRecognizer *)doubleTapDoubleTouchGesture  {
    CGAffineTransform currentTransform = self.testView.transform;
    CGAffineTransform newTransform = CGAffineTransformScale(currentTransform, 0.8f, 0.8f);
    [UIView animateWithDuration:0.3
                     animations:^{
                         self.testView.transform = newTransform;
                     }];
    self.testViewScale = 0.8f;
    NSLog(@"Double Tap: %@", NSStringFromCGPoint([doubleTapDoubleTouchGesture locationInView:self.view]));
}

// увеличение уменьшение двойным тачем
- (void)handlePinch:(UIPinchGestureRecognizer *)pinchGesture {
    
    if (pinchGesture.state == UIGestureRecognizerStateBegan) {
        self.testViewScale = 1.f;
    }
    
    CGFloat newScale =1.f + pinchGesture.scale - self.testViewScale;
    
    CGAffineTransform currentTransform = self.testView.transform;
    CGAffineTransform newTransform = CGAffineTransformScale(currentTransform, newScale, newScale);
    self.testView.transform = newTransform;
    
    self.testViewScale = pinchGesture.scale;
    
    NSLog(@"handle Pinch %1.3f", pinchGesture.scale);
}

- (void)handleRotation:(UIRotationGestureRecognizer *)rotationGesture {
    
    if (rotationGesture.state == UIGestureRecognizerStateBegan) {
        self.testViewRotation = 0;
    }
    
    CGFloat newRotation = rotationGesture.rotation - self.testViewRotation;
    
    CGAffineTransform currentTransform = self.testView.transform;
    CGAffineTransform newTransform = CGAffineTransformRotate(currentTransform, newRotation);
    self.testView.transform = newTransform;
    self.testViewRotation = rotationGesture.rotation;
    
     NSLog(@"handle Pinch %1.3f", rotationGesture.rotation);
}

- (void)handlePan:(UIPanGestureRecognizer *)panGesture {
    NSLog(@"handle Pan");
    self.testView.center = [panGesture locationInView:self.view];
}

- (void)handleVerticalSwipe:(UISwipeGestureRecognizer *)swipeGesture {
    NSLog(@"Vertical Swipe");
}
- (void)handleHorizontalSwipe:(UISwipeGestureRecognizer *)swipeGesture {
    NSLog(@"Horizontal Swipe");
}

#pragma mark -
#pragma mark UIGestureRecognizerDelegate

- (BOOL)                             gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer
    shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRequireFailureOfGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return [gestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]] &&
            [otherGestureRecognizer isKindOfClass:[UISwipeGestureRecognizer class]];
}

@end
