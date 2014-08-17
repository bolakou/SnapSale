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
    
    // Location related
    locationManager = [[CLLocationManager alloc] init];
    locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters;
    locationManager.delegate = self;
    [locationManager startUpdatingLocation];
    
    [self registerForKeyboardNotifications];
}
// Call this method somewhere in your view controller setup code.
- (void)registerForKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardWillHideNotification object:nil];
    
}

// Called when the UIKeyboardDidShowNotification is sent.
- (void)keyboardWasShown:(NSNotification*)aNotification
{
    NSDictionary* info = [aNotification userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, kbSize.height, 0.0);
    
    self.scrollView.contentInset = contentInsets;
    self.scrollView.scrollIndicatorInsets = contentInsets;
    
    // If active text field is hidden by keyboard, scroll it so it's visible
    // Your app might not need or want this behavior.
    CGRect aRect = self.view.frame;
    aRect.size.height -= kbSize.height;
    if (!CGRectContainsPoint(aRect, activeField.frame.origin) ) {
        [self.scrollView scrollRectToVisible:activeField.frame animated:YES];
    }
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    activeField = textField;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    activeField = nil;
}

// Called when the UIKeyboardWillHideNotification is sent
- (void)keyboardWillBeHidden:(NSNotification*)aNotification
{
    UIEdgeInsets contentInsets = UIEdgeInsetsZero;
    self.scrollView.contentInset = contentInsets;
    self.scrollView.scrollIndicatorInsets = contentInsets;
}
- (void) locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    CLLocation *newLocation = locations.lastObject;
    
    // in most cases you will not want to rely on cached measurements
    NSTimeInterval locationAge = -[newLocation.timestamp timeIntervalSinceNow];
    if (locationAge > 5.0) {
        return;
    }
    
    location = newLocation;
    [locationManager stopUpdatingLocation];
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
    
    CLLocationCoordinate2D cord = location.coordinate;
    PFGeoPoint *pfLocation = [PFGeoPoint geoPointWithLatitude:cord.latitude longitude:cord.longitude];
    newItem[@"location"] = pfLocation;
    
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
