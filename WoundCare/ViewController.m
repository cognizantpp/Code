//
//  ViewController.m
//  WoundCare
//
//  Created by Sangeetha on 19/03/15.
//
//

#import "ViewController.h"
#import "CoreDataHelper.h"
#import "AssignmentsViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.txtPassword.delegate = self;
    self.txtUserName.delegate = self;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    
    if(textField ==  self.txtUserName){
        //[self.txtUserName resignFirstResponder];
        [self.txtPassword becomeFirstResponder];
    }
    else{
        [textField resignFirstResponder];
    }
        
    return YES;
}

- (IBAction)btnLoginClicked:(id)sender {
    if ([self.txtUserName.text isEqualToString:@""] || [self.txtPassword.text isEqualToString:@""]) {
        [self showAlert:@"Username and password required"];
    }
    else{
        CoreDataHelper *coredataHelper = [CoreDataHelper sharedInstance];
        BOOL result = [coredataHelper validateUserId:self.txtUserName.text andpassword:self.txtPassword.text];
        if(result)
        {
            AssignmentsViewController *assignmentController =
            [self.storyboard instantiateViewControllerWithIdentifier:@"AssignmentsViewController"];
            [self presentViewController:assignmentController animated:NO completion:nil];
        }
        else{
            [self showAlert:@"Invalid username and password"];
        }
    }
}
-(void)showAlert:(NSString *)alertString{
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Login Validation" message:alertString delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alertView show];
}

-(void)textFieldDidBeginEditing:(UITextField *)textField{
    CGPoint scrollPoint = CGPointMake(0, textField.frame.origin.y);
    [self.scrollView setContentOffset:scrollPoint animated:NO];
    
}
-(void)textFieldDidEndEditing:(UITextField *)textField{
    [self.scrollView setContentOffset:CGPointZero animated:NO];
}


@end
