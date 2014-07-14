//
//  ListingView.h
//  SnapSale
//
//  Created by liyizhi kou on 14-7-13.
//  Copyright (c) 2014年 WJK Studio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListingView : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    IBOutlet UITableView *tableView;
    
    NSArray *UserNameArr;
    NSArray *UserAvatarArr;
    NSArray *PostTitleArr;
    NSArray *PostCoverArr;
    
    
}


@end
