//
//  SGTasksViewController.m
//  RewardAndDuty
//
//  Created by Jerome Mare on 01/12/2013.
//  Copyright (c) 2013 Jerome Mare. All rights reserved.
//

#import "SGTasksViewController.h"

#import "SGTask.h"
#import "SGTaskCell.h"


@interface SGTasksViewController ()

@end

@implementation SGTasksViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    // # Extract all task from CoreData
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription
                                   entityForName:@"SGTask" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    NSError *error;
    NSArray *persistedTasks = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    self.tasks = [[NSMutableArray alloc] initWithArray:persistedTasks];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    int nbTasks = [self.tasks count];
    return nbTasks;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // # Get the corresponding cell
    static NSString *CellIdentifier = @"TaskCell";
    SGTaskCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    //# Get task information and set it to cell
    SGTask *task = [self.tasks objectAtIndex:indexPath.row];
    cell.titleLabel.text = task.name;

    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"AddTask"])
    {
        UINavigationController *navigationController = segue.destinationViewController;
        SGTaskDetailViewController *taskDetailViewController = [[navigationController viewControllers] objectAtIndex:0];
        taskDetailViewController.delegate = self; }
}


#pragma mark - SGTaskDetailViewControllerDelegate

- (void)taskDetailViewControllerDidCancel: (SGTaskDetailViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)taskDetailViewControllerDidAddTask: (SGTaskDetailViewController *)controller
{
    
    // # Init the Task
    NSString* taskName = controller.nameTextField.text;
    int taskPoints = controller.pointsSegmentedControl.selectedSegmentIndex;
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"SGTask" inManagedObjectContext: self.managedObjectContext];
    SGTask* task = [[SGTask alloc] initWithEntity:entity insertIntoManagedObjectContext:self.managedObjectContext];

    task.name = taskName;
    task.points = [NSNumber numberWithInt:taskPoints];
    
    // # Save the task
    [self.tasks addObject:task];
    
    // # Update the table view
    NSIndexPath* indexPath = [NSIndexPath indexPathForRow:[self.tasks count]-1 inSection:0];
    [self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    // # Dismiss Add Screen
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
