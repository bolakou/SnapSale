//
//  FormViewController.h
//  CameraTest
//
//  Created by Sean Wang on 7/19/14.
//  Copyright (c) 2014 Sean Wang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "SubmitSuccessViewController.h"

@interface FormViewController : UIViewController<UITextFieldDelegate>

@property IBOutlet UIImageView *imageView;
@property IBOutlet UITextField *titleField;
@property IBOutlet UITextField *priceField;
@property IBOutlet UIButton *submitButton;
// How to set when initialized?
@property UIImage *image;

@end
