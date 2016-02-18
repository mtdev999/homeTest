//
//  MTMainView.h
//  MTDynamicCells
//
//  Created by Mark Tezza on 18.02.16.
//  Copyright © 2016 Mark Tezza. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MTMainView : UIView
@property (nonatomic, strong)   IBOutlet UITableView *tableView;

@property (nonatomic, strong)   UIColor   *colorCell;
@property (nonatomic, strong)   NSString  *nameCell;


@end
