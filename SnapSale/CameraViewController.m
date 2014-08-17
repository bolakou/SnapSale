//
//  ViewController.m
//  CameraTest
//
//  Created by Sean Wang on 7/18/14.
//  Copyright (c) 2014 Sean Wang. All rights reserved.
//

#import "CameraViewController.h"

@implementation CameraViewController
            
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    imagePicker = [[UIImagePickerController alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
   
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    UIGraphicsBeginImageContext(CGSizeMake(640, 960));
    [image drawInRect: CGRectMake(0, 0, 640, 960)];
    UIImage *smallImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    //[picker dismissViewControllerAnimated:YES completion:nil];
    FormViewController *view = (FormViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"nextview"];
    [view setImage:smallImage];
    [imagePicker pushViewController:view animated:YES];
}

- (void) onSellFinished {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)onSellButtonClicked {
    [imagePicker setSourceType:UIImagePickerControllerSourceTypeCamera];
    [imagePicker setAllowsEditing:NO];
    [imagePicker setCameraCaptureMode:UIImagePickerControllerCameraCaptureModePhoto];
    [imagePicker setDelegate: self];
    [self presentViewController:imagePicker animated:YES completion:nil];
}

@end
