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
#import "RageIAPHelper.h"

@implementation UIBuyGoldVIew {
    NSArray *tablePurchase;
    UITableView *tbl;
    
    NSArray *_products;
}

- (UIView *)viewForContentView {
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
    
    [self.contentView addSubview:tbl];
    [self.contentView addSubview:lbl];
    
    [[RageIAPHelper sharedInstance] requestProductsWithCompletionHandler:^(BOOL success, NSArray *products) {
        if (success) {
            _products = products;
        }
    }];
    
    RageIAPHelper *iaHelper = [RageIAPHelper sharedInstance];
    iaHelper.transitioncompletionHandler = ^(SKPaymentTransaction *transition) {
        // did complete buy icon
            
        
    };
    
    return self.contentView;
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
        cell.index = (int)indexPath.row;
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

- (void)buyGoldWithID:(int)priceID andProductIndex:(int)index{
    
    if (_products) {
        SKProduct *product = _products[index];
        [[RageIAPHelper sharedInstance] buyProduct:product];
    }
    
//    LCPurChaseTask *purchaseTask = [[LCPurChaseTask alloc] initWithPriceID:priceID];
//    [purchaseTask requestWithBlockSucess:^(id sucess) {
//        int totalCoin = [sucess[@"major_coins_total"] intValue] + [sucess[@"free_coins_total"] intValue];
//        [[LCFileManager shareInstance] setUserWithFreeCoin:[sucess[@"free_coins_total"] intValue] andTotalCoin:totalCoin];
//    } andBlockFailure:^(id error) {
//        
//    }];
}
@end
