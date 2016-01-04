//
//  ViewController.h
//  ToDoList
//
//  Created by Mark Tezza on 28.12.15.
//  Copyright © 2015 Mark Tezza. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController
@property (nonatomic, strong)   NSDate      *eventDate;
@property (nonatomic, strong)   NSString    *eventInfo;
@property (nonatomic, assign)   BOOL        isDetail;

@end

