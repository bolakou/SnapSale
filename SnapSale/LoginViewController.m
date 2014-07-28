//
//  LoginViewController.m
//  SnapSale
//
//  Created by Sean Wang on 7/27/14.
//  Copyright (c) 2014 WJK Studio. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    if ([PFUser currentUser] && [PFFacebookUtils isLinkedWithUser:[PFUser currentUser]]) {
        [self.navigationController pushViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"Main"] animated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loginButtonTouchHandler:(id)sender {
    NSArray *permissionArray = @[@"user_about_me"];
    
    [PFFacebookUtils logInWithPermissions:permissionArray block:^(PFUser *user, NSError *error) {
        [_activityIndicator stopAnimating];
        
        if (!user) {
            if (error) {
              UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Log In Error" message:[error description] delegate:nil cancelButtonTitle:nil otherButtonTitles:@"Dismiss", nil];
              [alert show];
            }
        } else {
            [self.navigationController pushViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"Main"] animated:YES];
        }
    }];
    
    [_activityIndicator startAnimating];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
