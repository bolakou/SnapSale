//
//  ListingView.h
//  SnapSale
//
//  Created by liyizhi kou on 14-7-13.
//  Copyright (c) 2014年 WJK Studio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface ListingView : UIViewController <UITableViewDelegate, UITableViewDataSource, NSURLConnectionDelegate, UIAlertViewDelegate>
{
    IBOutlet UITableView *tableView;
    
    NSArray *UserNameArr;
    NSArray *UserAvatarArr;
    NSArray *PostTitleArr;
    NSArray *PostCoverArr;
    
    
}

- (void)logoutButtonTouchHandler:(id)sender;
@end
