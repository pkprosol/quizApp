//
//  QZAGenerateQandA.m
//  quizApp
//
//  Created by Piotr K Prosol on 8/2/14.
//
//

#import "QZAGenerateQandA.h"

@implementation QZAGenerateQandA

+ (QZAQuestionAndAnswers *)generateSwipeExample
{
    NSString *question = @"Swipe to delete incorrect method declarations:";
    NSDictionary *answers = @{@"- NSString *string: methodName (void)": @"Incorrect",
                              @"- (void)methodName:NSString *string;": @"Incorrect",
                              @"- (NSString *)methodName:(NSInteger)int;": @"Correct"};

    QZAQuestionAndAnswers *swipeExample = [[QZAQuestionAndAnswers alloc] initWithQuestion:question Answers:answers];
    
    return swipeExample;
}

@end
