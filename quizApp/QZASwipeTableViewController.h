//
//  QZASwipeTableViewController.h
//  quizApp
//
//  Created by Piotr K Prosol on 8/2/14.
//
//

#import <UIKit/UIKit.h>
#import "QZAQuestionAndAnswers.h"

@interface QZASwipeTableViewController : UITableViewController <UIAlertViewDelegate>

@property (strong ,nonatomic) QZAQuestionAndAnswers *questionsAndAnswers;
@property (strong, nonatomic) NSMutableArray *answers;
@property (nonatomic) NSInteger answerCounter;
@property (nonatomic) BOOL correctAnswer;

@end
