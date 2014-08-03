//
//  QZABasicQuizViewController.m
//  quizApp
//
//  Created by Piotr K Prosol on 7/31/14.
//
//

#import "QZABasicQuizViewController.h"
#import "QZACheckAnswer.h"
#import <AAAAchievementManager.h>
#import <AAAGamificationManager.h>
#import <AnimatedGif.h>
#import "QZAAlertViewManager.h"

@interface QZABasicQuizViewController ()

@property (weak, nonatomic) IBOutlet UITextField *helloResponse;
@property (weak, nonatomic) IBOutlet UITextField *piResponse;
@property (weak, nonatomic) IBOutlet UITextField *basicPropertyResponse;
@property (weak, nonatomic) IBOutlet UITextField *sayHiResponse;

@property (weak, nonatomic) IBOutlet AAAScoreView *scoreView;
@property (weak, nonatomic) IBOutlet UIImageView *successImageView;

@end

@implementation QZABasicQuizViewController

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
    
    self.helloResponse.delegate = self;
    self.piResponse.delegate = self;
    self.basicPropertyResponse.delegate = self;
    self.sayHiResponse.delegate = self;
    
    NSURL *localUrl = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"apple" ofType:@"gif"]];
    self.successImageView = [AnimatedGif getAnimationForGifAtUrl: localUrl];

    self.successImageView.frame = CGRectMake(10.0f, 194.0f, 100, 300);

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if ([textField.accessibilityLabel isEqualToString:@"hello"]) {
        [self handleResponseFromTextField:textField WithAnswer:@"NSString *string = @\"Hello World!\";"];
        
    } else if ([textField.accessibilityLabel isEqualToString:@"pi"]) {
        [self handleResponseFromTextField:textField WithAnswer:@"NSNumber *pi = @3.14;"];

    } else if ([textField.accessibilityLabel isEqualToString:@"basicProperty"]) {
        [self handleResponseFromTextField:textField WithAnswer:@"@property NSNumber* number;"];
    
    } else if ([textField.accessibilityLabel isEqualToString:@"sayHi"]) {
        [self handleResponseFromTextField:textField WithAnswer:@"- (void)sayHi:(NSString *)string;"];
    
    }

    return YES;
}

- (void)handleResponseFromTextField:(UITextField *)textField WithAnswer:(NSString *)answer
{
    if ([QZACheckAnswer checkIfResponseCorrect:textField.text ForAnswer:answer]) {
        [QZAAlertViewManager popAlertViewWithTitle:@"Correct!" AndMessage:@"Nice job"];
        // [self handleWinWithPoints:10];
        // [self.NSNumberPIResponse becomeFirstResponder];
    } else {
        [QZAAlertViewManager popAlertViewWithTitle:@"Incorrect" AndMessage:@"Try again!"];
        // [textField becomeFirstResponder];
    }
    // [textField resignFirstResponder];
}

- (void)handleWinWithPoints:(NSInteger)points
{
    [[AAAGamificationManager sharedManager] setScoreView:self.scoreView];
    [[AAAGamificationManager sharedManager] addToMainPlayerScore:points];
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

@end
