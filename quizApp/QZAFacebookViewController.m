//
//  QZAFacebookViewController.m
//  quizApp
//
//  Created by Piotr K Prosol on 8/3/14.
//
//

#import "QZAFacebookViewController.h"

@interface QZAFacebookViewController ()

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation QZAFacebookViewController

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
    
    NSURL *facebookURL = [NSURL URLWithString:@"http://www.twitter.com"];
    
    NSURLRequest *facebookRequest = [NSURLRequest requestWithURL:facebookURL];
    
    [self.webView loadRequest:facebookRequest];
    
    [NSTimer scheduledTimerWithTimeInterval:15 target:self selector:@selector(dismissModalView) userInfo:nil repeats:NO];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dismissModalView
{
    [self dismissViewControllerAnimated:YES completion:nil];
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
