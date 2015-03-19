//
//  ViewController.h
//  WoundCare
//
//  Created by Sangeetha on 19/03/15.
//
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *txtUserName;
@property (strong, nonatomic) IBOutlet UITextField *txtPassword;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
- (IBAction)btnLoginClicked:(id)sender;
@end
