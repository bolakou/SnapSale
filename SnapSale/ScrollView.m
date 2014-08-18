//
//  ScrollView.m
//  SnapSale
//
//  Created by liyizhi kou on 14-8-16.
//  Copyright (c) 2014年 WJK Studio. All rights reserved.
//

#import "ScrollView.h"

@interface ScrollView ()

@end

@implementation ScrollView


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
    // Do any additional setup after loading the view.

    self.D_Post_Title.text = [self.Post objectForKey:@"title"];
    self.D_Post_Image.file = (PFFile *)[self.Post objectForKey:@"image"];
    [self.D_Post_Image loadInBackground];
    
    [self.ScrollView setScrollEnabled:YES];
    [self.ScrollView setContentSize:CGSizeMake(320, 1500)];
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
