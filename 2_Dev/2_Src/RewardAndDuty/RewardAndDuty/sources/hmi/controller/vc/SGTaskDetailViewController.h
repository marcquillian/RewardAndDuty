//
//  SGTaskDetailViewController.h
//  RewardAndDuty
//
//  Created by Jerome Mare on 01/12/2013.
//  Copyright (c) 2013 Jerome Mare. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SGTaskDetailViewController;


@protocol SGTaskDetailViewControllerDelegate <NSObject>
 - (void)taskDetailViewControllerDidCancel:(SGTaskDetailViewController *)controller;
 - (void)taskDetailViewControllerDidSave:(SGTaskDetailViewController *)controller;
@end

@interface SGTaskDetailViewController : UITableViewController
@property (strong, nonatomic) IBOutlet UITextField *nameTextField;

@property (nonatomic, weak) id <SGTaskDetailViewControllerDelegate>
delegate;
- (IBAction)cancel:(id)sender;
- (IBAction)done:(id)sender;



@end