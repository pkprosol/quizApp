//
//  QZASwipeTableViewController.m
//  quizApp
//
//  Created by Piotr K Prosol on 8/2/14.
//
//

#import "QZASwipeTableViewController.h"
#import "QZAGenerateQandA.h"
#import "QZAAlertViewManager.h"

@interface QZASwipeTableViewController ()

@end

@implementation QZASwipeTableViewController

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
    
    [self resetQuestionsAndAnswers];
    
    self.correctAnswer = NO;
    
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
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [self.answers count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return self.questionsAndAnswers.questionText;
    }
    
    return nil;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"methodCheckCell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    NSLog(@"%d", indexPath.section);
        
    cell.textLabel.text = self.answers[indexPath.row];
    
    return cell;
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *answerString = self.answers[indexPath.row];
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [self.answers removeObject:self.answers[indexPath.row]];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
        self.answerCounter--;
        
        if (self.answerCounter == 0) {
            NSString *remainingAnswer = self.answers[0];
            
            NSString *answer = self.questionsAndAnswers.answers[remainingAnswer];
            NSLog(@"%@", answer);
            
            if ([answer isEqualToString:@"Correct"]) {
                UIAlertView *correctAlert = [QZAAlertViewManager popAlertViewWithTitle:@"Correct" AndMessage:@"Nice job!"];
                correctAlert.delegate = self;
                [correctAlert show];
                self.correctAnswer = YES;
                
            } else {
                [self.tableView reloadData];
                
                UIAlertView *errorAlert = [QZAAlertViewManager popAlertViewWithTitle:@"Sorry try again!" AndMessage:@"This is not a correct method declaration."];
                errorAlert.delegate = self;
                [errorAlert show];
                
//                UILocalNotification *note = [[UILocalNotification alloc] init];
//                note.alertBody = @"Baseball game starting now";
//                
//                UIApplication *application = [UIApplication sharedApplication];
//                
//                [application presentLocalNotificationNow:note];
                
            }
        }
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (self.correctAnswer == NO) {
        [self resetQuestionsAndAnswers];
    } else {
        [self.tableView reloadData];
    }
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%d", self.correctAnswer);
    if (self.correctAnswer != 0) {
        [cell setBackgroundColor:[UIColor greenColor]];
    } else if (self.answerCounter == 0) {
        [cell setBackgroundColor:[UIColor redColor]];
    } else {
        [cell setBackgroundColor:[UIColor whiteColor]];
    }
}

- (void)resetQuestionsAndAnswers
{
    self.questionsAndAnswers = [QZAGenerateQandA generateSwipeExample];
    
    self.answers = [NSMutableArray new];
    self.correctAnswer = NO;
    [self.answers addObjectsFromArray:[self.questionsAndAnswers.answers allKeys]];
    
    self.answerCounter = [self.answers count] - 1;
    
    [self.tableView reloadData];
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
