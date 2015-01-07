//
//  UIHistoryView.m
//  SpriteDemo
//
//  Created by Le Cong on 12/12/14.
//  Copyright (c) 2014 Lê Công. All rights reserved.
//

#import "UIHistoryView.h"
#import "HistoryTableViewCell.h"
#import "LCGetHistoryTask.h"

@implementation UIHistoryView {
    NSMutableArray *histories;
    UITableView *tbl;

    NSString *nextUrl;
    BOOL isLoadmore;
    
    LCGetHistoryTask *getHistory;
}

- (UIView *)viewForContentView {
    
    getHistory = [[LCGetHistoryTask alloc] init];
    
    UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(54, 30, 460, 243)];
    
    UILabel *lblDate = [[UILabel alloc] initWithFrame:CGRectMake(37, 34, 83, 30)];
    lblDate.text = @"DATE";
    lblDate.font = [UIFont boldSystemFontOfSize:18];
    lblDate.textColor = [UIColor whiteColor];
    [lblDate sizeToFit];

    UILabel *lblTime = [[UILabel alloc] initWithFrame:CGRectMake(150, 34, 83, 30)];
    lblTime.text = @"TIME";
    lblTime.font = [UIFont boldSystemFontOfSize:18];
    lblTime.textColor = [UIColor whiteColor];
    [lblTime sizeToFit];
    
    UILabel *lblBet = [[UILabel alloc] initWithFrame:CGRectMake(266, 34, 83, 30)];
    lblBet.text = @"BET";
    lblBet.font = [UIFont boldSystemFontOfSize:18];
    lblBet.textColor = [UIColor whiteColor];
    [lblBet sizeToFit];
    
    UILabel *lblWine = [[UILabel alloc] initWithFrame:CGRectMake(377, 34, 83, 30)];
    lblWine.text = @"WIN";
    lblWine.font = [UIFont boldSystemFontOfSize:18];
    lblWine.textColor = [UIColor whiteColor];
    [lblWine sizeToFit];
    
    tbl = [[UITableView alloc] initWithFrame:CGRectMake(20, 62, 400, 160)];
    tbl.backgroundColor = [UIColor clearColor];
    tbl.separatorStyle = UITableViewCellSeparatorStyleNone;
    tbl.showsVerticalScrollIndicator = NO;
    tbl.delegate = self;
    tbl.dataSource = self;
    
    [contentView addSubview:tbl];
    
    
    [contentView addSubview:lblDate];
    [contentView addSubview:lblTime];
    [contentView addSubview:lblBet];
    [contentView addSubview:lblWine];
    return contentView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return histories.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HistoryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        cell = [[HistoryTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    LCHistory *history = histories[indexPath.row];
    [cell setHistory:history];
    
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)aScrollView {
    CGPoint offset = aScrollView.contentOffset;
    CGRect bounds = aScrollView.bounds;
    CGSize size = aScrollView.contentSize;
    UIEdgeInsets inset = aScrollView.contentInset;
    float y = offset.y + bounds.size.height - inset.bottom;
    float h = size.height;
    
    float reload_distance = 10;
    if(y > h + reload_distance) {
        if (!isLoadmore) {
            isLoadmore = true;
            [self getMoreHistories];
            NSLog(@"load more rows");
        }
    }
}

- (void)sentRequest {
    
    [getHistory requestWithBlockSucess:^(id sucess) {
        histories = sucess[@"histories"];
        nextUrl = sucess[@"next"];
        [tbl reloadData];
    } andBlockFailure:^(id error) {
        
    }];
}

- (void)getMoreHistories {
    getHistory.nextUrl = nextUrl;
    [getHistory requestWithBlockSucess:^(id sucess) {

        for (LCHistory *history in sucess[@"histories"]) {
            [histories addObject:history];
        }
        
        nextUrl = sucess[@"next"];
        if ([nextUrl isEqualToString:@""]) {
            isLoadmore = true;
        } else {
            isLoadmore = false;
        }
        
        [tbl reloadData];
        
    } andBlockFailure:^(id error) {
        
    }];
}

@end
