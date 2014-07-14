//
//  Postcell.h
//  SnapSale
//
//  Created by liyizhi kou on 14-7-13.
//  Copyright (c) 2014年 WJK Studio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Postcell : UITableViewCell

//Variable For PostCard Use
@property (nonatomic, strong) IBOutlet UILabel *UserName;
@property (strong, nonatomic) IBOutlet UIImageView *UserAvatar;

@property (nonatomic, strong) IBOutlet UILabel *PostTitle;
@property (strong, nonatomic) IBOutlet UIImageView *PostCover;


@end
