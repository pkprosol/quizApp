//
//  QZAAlertViewManager.h
//  quizApp
//
//  Created by Piotr K Prosol on 8/3/14.
//
//

#import <Foundation/Foundation.h>

@interface QZAAlertViewManager : NSObject

+ (UIAlertView *)popAlertViewWithTitle:(NSString *)title AndMessage:(NSString *)message;

@end
