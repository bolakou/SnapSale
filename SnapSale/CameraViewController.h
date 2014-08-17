//
//  ViewController.h
//  CameraTest
//
//  Created by Sean Wang on 7/18/14.
//  Copyright (c) 2014 Sean Wang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FormViewController.h"

@interface CameraViewController : UIViewController<UINavigationBarDelegate, UIImagePickerControllerDelegate> {
    UIImagePickerController *imagePicker;
}

- (void) onSellFinished;
@end

