//
//  SubmitSuccessViewController.m
//  CameraTest
//
//  Created by Sean Wang on 7/20/14.
//  Copyright (c) 2014 Sean Wang. All rights reserved.
//

#import "SubmitSuccessViewController.h"

@interface SubmitSuccessViewController ()

@end

@implementation SubmitSuccessViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    PFObject *item = [PFQuery getObjectOfClass:@"Item" objectId:self.objectID];
    
    [self.titleLabel setText:item[@"title"]];
    [self.priceLabel setText:item[@"price"]];
    
    PFFile *itemImageFile = item[@"image"];
    [itemImageFile getDataInBackgroundWithBlock:^(NSData *imageData, NSError *error) {
        if (!error) {
            UIImage *image = [UIImage imageWithData:imageData];
            [self.imageView setImage:image];
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
