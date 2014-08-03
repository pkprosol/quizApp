//
//  QZASelectCellsTableViewController.m
//  quizApp
//
//  Created by Piotr K Prosol on 8/3/14.
//
//

#import "QZASelectCellsTableViewController.h"
#import "QZAAlertViewManager.h"

@interface QZASelectCellsTableViewController ()

- (IBAction)finalAnswerTapped:(id)sender;

@end

@implementation QZASelectCellsTableViewController

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
    
    self.mistakeCounter = 0;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 4;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"Select the rows that define variables correctly:";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"selectCell" forIndexPath:indexPath];
    cell.selected = NO;
    
    // Configure the cell...
    
    NSInteger rowNumber = indexPath.row;
    
    if (rowNumber == 0) {
        cell.textLabel.text = @"NSNumber number == 10;";
    } else if (rowNumber == 1) {
        cell.textLabel.text = @"(NSString *)string = @Hello;";
    } else if (rowNumber == 2) {
        cell.textLabel.text = @"NSInteger ten = 10;";
    } else if (rowNumber == 3) {
        cell.textLabel.text = @"NSNumber *ten = @10";
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row != 2) {
        self.mistakeCounter++;
    }
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row != 2) {
        self.mistakeCounter--;
    } else {
        self.mistakeCounter++;
    }
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)finalAnswerTapped:(id)sender {
    if (self.mistakeCounter == 0) {
        UIAlertView *successAlert = [QZAAlertViewManager popAlertViewWithTitle:@"You're right!" AndMessage:nil];
        successAlert.delegate = self;
        [successAlert show];
    } else {
        UIAlertView *failureAlert = [QZAAlertViewManager popAlertViewWithTitle:@"Nope!" AndMessage:nil];
        failureAlert.delegate = self;
        [failureAlert show];
    }
    
    self.finalAnswerButtonTapped = YES;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    [self.tableView reloadData];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.finalAnswerButtonTapped) {
        if (indexPath.row != 2) {
            [cell setBackgroundColor:[UIColor redColor]];
        } else {
            [cell setBackgroundColor:[UIColor greenColor]];
        }
    }
}

@end
