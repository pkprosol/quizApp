//
//  QZAAlertViewManager.m
//  quizApp
//
//  Created by Piotr K Prosol on 8/3/14.
//
//

#import "QZAAlertViewManager.h"

@implementation QZAAlertViewManager

+ (UIAlertView *)popAlertViewWithTitle:(NSString *)title AndMessage:(NSString *)message
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    
    return alert;
}

@end
