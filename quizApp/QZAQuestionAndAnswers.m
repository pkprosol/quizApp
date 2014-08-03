//
//  QZAQuestionAndAnswers.m
//  quizApp
//
//  Created by Piotr K Prosol on 8/2/14.
//
//

#import "QZAQuestionAndAnswers.h"

@implementation QZAQuestionAndAnswers

- (instancetype)initWithQuestion:(NSString *)question Answers:(NSDictionary *)answers
{
    self = [super init];
    if (self) {
        self.questionText = question;
        self.answers = answers;
    }
    
    return self;
}

@end
