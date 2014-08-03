//
//  QZAPickerViewController.m
//  quizApp
//
//  Created by Piotr K Prosol on 8/3/14.
//
//

#import "QZAPickerViewController.h"
#import "QZAAlertViewManager.h"

@interface QZAPickerViewController ()

@property (weak, nonatomic) IBOutlet UIPickerView *picker;
- (IBAction)finalAnswerTapped:(id)sender;

@end

@implementation QZAPickerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.picker.dataSource = self;
    self.picker.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 3;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == 0) {
        if (row == 0) {
            return @"NSInteger *";
        } else if (row == 1) {
            return @"- void (int)";
        } else if (row == 2) {
            return @"- (void)";
        }
    } else if (component == 1) {
        if (row == 0) {
            return @"sayHello;";
        } else if (row == 1) {
            return @"integer *;";
        } else if (row == 2) {
            return @"(NSString *)";
        }
    }
    
    return nil;
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

- (IBAction)finalAnswerTapped:(id)sender {
    NSInteger firstRow = [self.picker selectedRowInComponent:0];
    NSInteger secondRow = [self.picker selectedRowInComponent:1];
    
    if (firstRow == 2 && secondRow == 0) {
        UIAlertView *successAlert = [QZAAlertViewManager popAlertViewWithTitle:@"You're awesome..." AndMessage:@"...awesome!!!"];
        [successAlert show];
    } else {
        UIAlertView *failureAlert = [QZAAlertViewManager popAlertViewWithTitle:@"Unfortunately not!" AndMessage:nil];
        [failureAlert show];
    }
}

@end
