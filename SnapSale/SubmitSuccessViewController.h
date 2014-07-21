//
//  SubmitSuccessViewController.h
//  CameraTest
//
//  Created by Sean Wang on 7/20/14.
//  Copyright (c) 2014 Sean Wang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface SubmitSuccessViewController : UIViewController

@property IBOutlet UILabel *titleLabel;
@property IBOutlet UILabel *priceLabel;
@property IBOutlet UIImageView *imageView;

@property NSString *objectID;
@end
