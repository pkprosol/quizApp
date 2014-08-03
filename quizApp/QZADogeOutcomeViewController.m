//
//  QZADogeOutcomeViewController.m
//  quizApp
//
//  Created by Piotr K Prosol on 8/3/14.
//
//

#import "QZADogeOutcomeViewController.h"

@interface QZADogeOutcomeViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
- (IBAction)continueButtonTapped:(id)sender;

@end

@implementation QZADogeOutcomeViewController

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
    
    self.imageView.image = [UIImage imageNamed:@"doge.png"];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

- (IBAction)continueButtonTapped:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
