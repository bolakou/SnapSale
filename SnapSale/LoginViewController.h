//
//  LoginViewController.h
//  SnapSale
//
//  Created by Sean Wang on 7/27/14.
//  Copyright (c) 2014 WJK Studio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface LoginViewController : UIViewController

@property (nonatomic, strong) IBOutlet UIActivityIndicatorView *activityIndicator;
- (IBAction)loginButtonTouchHandler:(id)sender;

@end
