//
//  ListingView.m
//  SnapSale
//
//  Created by liyizhi kou on 14-7-13.
//  Copyright (c) 2014年 WJK Studio. All rights reserved.
//

#import "ListingView.h"
#import "Postcell.h"

@interface ListingView ()

@end

@implementation ListingView

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
    UserNameArr = [[NSArray alloc] initWithObjects:@"kou",@"sean" ,nil];
    UserAvatarArr = [[NSArray alloc] initWithObjects:@"avatar.png",@"avatar.png", nil];
    
    PostTitleArr = [[NSArray alloc] initWithObjects:@"Comic for $500",@"Sofa for $1000", nil];
    PostCoverArr = [[NSArray alloc] initWithObjects:@"p1.jpg",@"p3.jpg" ,nil];

    
}


//To Make Space Between Each Cell
//Let table create a section to each
//cell. Then use "header of section" to
//do space job
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return PostCoverArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10; // you can have your own choice, of course
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[UIView alloc] init];
    headerView.backgroundColor = [UIColor clearColor];
    return headerView;
}


//Function to edit each cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //create Cell
    static NSString *CellIdentifier = @"postcard";
    Postcell *cell = [tableView
                              dequeueReusableCellWithIdentifier:CellIdentifier
                              forIndexPath:indexPath];
    
    //Cell Style
    //cell.contentView.backgroundColor = [UIColor blueColor];
    
    //Cell Data
    cell.UserName.text = [UserNameArr objectAtIndex:indexPath.section];
    cell.UserAvatar.image = [UIImage imageNamed:[UserAvatarArr objectAtIndex:indexPath.section]];
    cell.PostTitle.text = [PostTitleArr objectAtIndex:indexPath.section];
    cell.PostCover.image = [UIImage imageNamed:[PostCoverArr objectAtIndex:indexPath.section]];
    
    return cell;
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
