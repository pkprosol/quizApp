//
//  QZACheckAnswer.h
//  quizApp
//
//  Created by Piotr K Prosol on 7/31/14.
//
//

#import <Foundation/Foundation.h>

@interface QZACheckAnswer : NSObject

+ (BOOL)checkIfResponseCorrect:(NSString *)response ForAnswer:(NSString *)answer;

+ (NSString *)trimSpacesFromString:(NSString *)inputString;

@end
