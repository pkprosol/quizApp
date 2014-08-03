//
//  QZACheckAnswer.m
//  quizApp
//
//  Created by Piotr K Prosol on 7/31/14.
//
//

#import "QZACheckAnswer.h"

@implementation QZACheckAnswer

+ (BOOL)checkIfResponseCorrect:(NSString *)response ForAnswer:(NSString *)answer
{
    response = [QZACheckAnswer trimSpacesFromString:response];
    answer = [QZACheckAnswer trimSpacesFromString:answer];
    
    if ([response isEqualToString:answer]) {
        return YES;
    } else {
        return NO;
    }
}

+ (NSString *)trimSpacesFromString:(NSString *)inputString
{
    NSString *cleanString = [inputString stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    return cleanString;
}

@end
