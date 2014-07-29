//
//  ListingAroundCell.h
//  SnapSale
//
//  Created by liyizhi kou on 14-7-26.
//  Copyright (c) 2014年 WJK Studio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Parse/Parse.h"


@interface ListingAroundCell : PFTableViewCell
@property (strong, nonatomic) IBOutlet UILabel *P_Title;
@property (strong, nonatomic) IBOutlet PFImageView *CoverImage;


@end
