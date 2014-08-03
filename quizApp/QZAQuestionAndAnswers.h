//
//  QZAQuestionAndAnswers.h
//  quizApp
//
//  Created by Piotr K Prosol on 8/2/14.
//
//

#import <Foundation/Foundation.h>

@interface QZAQuestionAndAnswers : NSObject

@property (strong, nonatomic) NSString *questionText;
@property (strong, nonatomic) NSDictionary *answers;

- (instancetype)initWithQuestion:(NSString *)question Answers:(NSDictionary *)answers;

@end
