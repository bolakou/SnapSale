//
//  FormViewController.m
//  CameraTest
//
//  Created by Sean Wang on 7/19/14.
//  Copyright (c) 2014 Sean Wang. All rights reserved.
//

#import "FormViewController.h"

@interface FormViewController ()

@end

@implementation FormViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [[self imageView] setImage:[self image]];
    UIBarButtonItem *doneItem =
        [[UIBarButtonItem alloc]
            initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                 target:self
                                 action:@selector(doneButtonDidPressed:)
        ];
    UIBarButtonItem *flexableItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:NULL];
    UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 44)];
    [toolbar setItems:[NSArray arrayWithObjects:flexableItem,doneItem, nil]];
    self.priceField.inputAccessoryView = toolbar;
    // TODO: text config 
}

- (void)doneButtonDidPressed:(id)sender {
    [self.priceField resignFirstResponder];
}

- (IBAction)onSubmitClick
{
    // Get name and price, get the picture, upload
    NSString *title = [[self titleField] text];
    NSString *price = [[self priceField] text];
    NSLog(@"the title is %@ and price is %@", title, price);
    PFObject *newItem = [PFObject objectWithClassName:@"Item"];
    newItem[@"title"] = title;
    // TODO: cast
    newItem[@"price"] = price;
    
    NSData *imageData = UIImageJPEGRepresentation(self.image, 0.05f);
    PFFile *imageFile = [PFFile fileWithName:@"image.jpeg" data:imageData];
    newItem[@"image"] = imageFile;
    
    [newItem saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        // Jump to a new page
        if (succeeded) {
            NSLog(@"succeed!");
            SubmitSuccessViewController *view = [self.storyboard instantiateViewControllerWithIdentifier:@"success_controller"];
            view.objectID = [newItem objectId];
            [self.navigationController pushViewController:view animated: YES];
        } else {
            NSLog(@"ooops");
        }
    }];
}
//[textField resignFirstResponder];


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    // it is pretty hacky to use if else to do this thing...
    if ([textField tag] == [[self titleField] tag]) {
        [[self priceField] becomeFirstResponder];
    }
    return YES;
}
@end
