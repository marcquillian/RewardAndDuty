//
//  SGTasksViewController.h
//  RewardAndDuty
//
//  Created by Jerome Mare on 01/12/2013.
//  Copyright (c) 2013 Jerome Mare. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SGTaskDetailViewController.h"


@interface SGTasksViewController : UITableViewController <SGTaskDetailViewControllerDelegate>

/** List of tasks to display */
@property (strong, nonatomic) NSMutableArray* tasks;

@end
