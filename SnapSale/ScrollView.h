//
//  ScrollView.h
//  SnapSale
//
//  Created by liyizhi kou on 14-8-16.
//  Copyright (c) 2014年 WJK Studio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface ScrollView : UIViewController

@property (strong, nonatomic) IBOutlet UIScrollView *ScrollView;
@property (strong, nonatomic) IBOutlet UILabel *D_Post_Title;
@property (strong, nonatomic) IBOutlet PFImageView *D_Post_Image;
@property (weak, nonatomic) PFObject *Post;

@end
