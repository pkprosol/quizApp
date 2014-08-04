//
//  QZADragRowsTableViewController.m
//  quizApp
//
//  Created by Piotr K Prosol on 8/4/14.
//
//

#import "QZADragRowsTableViewController.h"
#import "QZAAlertViewManager.h"

@interface QZADragRowsTableViewController ()

- (IBAction)finishedButtonTapped:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *finishedButton;

@end

@implementation QZADragRowsTableViewController

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
    
    self.tableView.editing = YES;
        
    self.answerArray = @[@"- (void)sayHello {", @"     NSString *hello = @\"Hello!\";", @"     NSLog(@\"%@\", hello);", @"}"];
    //self.answerArray = @[@"test1", @"test2", @"test3", @"test4"];
    
    self.currentArray = [NSMutableArray new];
    [self.currentArray addObjectsFromArray:self.answerArray];
    
    while ([self.currentArray isEqualToArray:self.answerArray]) {
        [self randomizeArray];
    }
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)randomizeArray
{
    for (NSInteger i = 0; i < 10; i++) {
        NSInteger random = arc4random() % ([self.currentArray count]);
        [self.currentArray exchangeObjectAtIndex:random withObjectAtIndex:0];
    }
    
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
    NSLog(@"Current array count: %d", [self.currentArray count]);
    //return [self.currentArray count];
    return 4;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"Drag and rearrange the rows to appear in the right order";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"dragCell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    NSInteger rowNumber = indexPath.row;
    
    cell.textLabel.text = self.currentArray[rowNumber];
    
    cell.showsReorderControl = YES;
    
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

// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
    NSInteger startingPosition = fromIndexPath.row;
    NSInteger endingPosition = toIndexPath.row;

    NSLog(@"Starting position %d:", startingPosition);
    NSLog(@"Ending position: %d:", endingPosition);
    
    NSString *startingString = self.currentArray[startingPosition];
    
    if (startingPosition > endingPosition) {
        [self.currentArray insertObject:startingString atIndex:endingPosition];
        startingPosition++;
        [self.currentArray removeObjectAtIndex:startingPosition];
    } else if (startingPosition < endingPosition) {
        [self.currentArray removeObjectAtIndex:startingPosition];
        [self.currentArray insertObject:startingString atIndex:endingPosition];
    }
    
    
    NSLog(@"Array: %@", self.currentArray);

}

// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleNone;
}

- (BOOL)tableView:(UITableView *)tableView shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)finishedButtonTapped:(id)sender {
    
    NSLog(@"Answers: %@", self.answerArray);
    NSLog(@"Current state: %@", self.currentArray);
    
    if ([self checkAnswer]) {
        self.tableView.editing = NO;
        UIAlertView *successAlert = [QZAAlertViewManager popAlertViewWithTitle:@"Correct!" AndMessage:@"Great Job!"];
        [successAlert show];
        self.finishedButton.enabled = NO;

    } else {
        UIAlertView *failureAlert = [QZAAlertViewManager popAlertViewWithTitle:@"Try again." AndMessage:nil];
        [failureAlert show];
    }
}

- (BOOL)checkAnswer
{
    BOOL isCorrect = YES;
    
    for (NSInteger i = 0; i < [self.answerArray count]; i ++) {
        if (![self.answerArray[i] isEqualToString:self.currentArray[i]]) {
            isCorrect = NO;
        }
    }
    
    return isCorrect;
}

@end
