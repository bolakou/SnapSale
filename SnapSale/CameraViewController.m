//
//  ViewController.m
//  CameraTest
//
//  Created by Sean Wang on 7/18/14.
//  Copyright (c) 2014 Sean Wang. All rights reserved.
//

#import "MyViewController.h"

@implementation MyViewController
            
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setSourceType:UIImagePickerControllerSourceTypeCamera];
    [self setAllowsEditing:NO];
    [self setCameraCaptureMode:UIImagePickerControllerCameraCaptureModePhoto];
    [self setDelegate: self];
    // TODO difference between DidLoad and DidAppear
}

- (void) viewDidAppear:(BOOL)animated {
    
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
    FormViewController *view = (FormViewController *)[[self storyboard] instantiateViewControllerWithIdentifier:@"nextview"];
    [view setImage:smallImage];
    [self pushViewController:view animated:YES];
}

@end
