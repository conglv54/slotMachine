//
//  UIBuyGoldVIew.m
//  SpriteDemo
//
//  Created by Le Cong on 12/11/14.
//  Copyright (c) 2014 Lê Công. All rights reserved.
//

#import "UIBuyGoldVIew.h"
#import "LCPurChaseTask.h"
#import "LCGetTablePurchaseTask.h"
#import "LCFileManager.h"

@implementation UIBuyGoldVIew {
    NSArray *tablePurchase;
    UITableView *tbl;
}

- (UIView *)viewForContentView {
    UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(54, 30, 460, 243)];
    
    UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(190, 19, 83, 30)];
    lbl.text = @"BUY GOLD";
    lbl.font = [UIFont boldSystemFontOfSize:18];
    lbl.textColor = [UIColor whiteColor];
    [lbl sizeToFit];
    
    tbl = [[UITableView alloc] initWithFrame:CGRectMake(24, 51, 412, 160)];
    tbl.backgroundColor = [UIColor clearColor];
    tbl.separatorStyle = UITableViewCellSeparatorStyleNone;
    tbl.showsVerticalScrollIndicator = NO;
    tbl.delegate = self;
    tbl.dataSource = self;
    
    [contentView addSubview:tbl];
    [contentView addSubview:lbl];
    return contentView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return tablePurchase.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BuyGoldTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        cell = [[BuyGoldTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
        cell.delegate = self;
    }
    
    LCTablePurchase *purchase = tablePurchase[indexPath.row];
    [cell setTablePurchase:purchase];
    return cell;
}

- (void)sentRequest {
    LCGetTablePurchaseTask *getTablePurchase = [[LCGetTablePurchaseTask alloc] init];
    [getTablePurchase requestWithBlockSucess:^(id sucess) {
        tablePurchase = sucess;
        [tbl reloadData];
    } andBlockFailure:^(id error) {
        
    }];
}

#pragma mark - Buy gold Delegate

- (void)buyGoldWithID:(int)priceID {
    LCPurChaseTask *purchaseTask = [[LCPurChaseTask alloc] initWithPriceID:priceID];
    [purchaseTask requestWithBlockSucess:^(id sucess) {
        if ([_delegate respondsToSelector:@selector(didBuyGold:)]) {
            [_delegate didBuyGold:[sucess[@"major_coins_total"] intValue]];
        }
    } andBlockFailure:^(id error) {
        
    }];
}
@end
