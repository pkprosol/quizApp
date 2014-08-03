//
//  QZASelectCellsTableViewController.h
//  quizApp
//
//  Created by Piotr K Prosol on 8/3/14.
//
//

#import <UIKit/UIKit.h>

@interface QZASelectCellsTableViewController : UITableViewController <UIAlertViewDelegate>

@property (nonatomic) NSInteger mistakeCounter;
@property (nonatomic) BOOL finalAnswerButtonTapped;

@end
