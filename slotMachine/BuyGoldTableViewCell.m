//
//  BuyGoldTableViewCell.m
//  SpriteDemo
//
//  Created by Le Cong on 12/12/14.
//  Copyright (c) 2014 Lê Công. All rights reserved.
//

#import "BuyGoldTableViewCell.h"

@implementation BuyGoldTableViewCell {
    UILabel *lblGold;
    UILabel *lblExtra;
    UILabel *lblMoney;
    UIButton *btnBuy;

    LCTablePurchase *_tablePurchase;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        UIImage *imgBg = [UIImage imageNamed:@"bgBuyGoldCell"];
        UIImageView *imv = [[UIImageView alloc] initWithImage:imgBg];
        [self addSubview:imv];
        
        UIImage *imgGold = [UIImage imageNamed:@"icGold"];
        UIImageView *imvGold = [[UIImageView alloc] initWithImage:imgGold];
        imvGold.frame = CGRectMake(10, 12, imgGold.size.width, imgGold.size.height);
        [self addSubview:imvGold];
        
        lblGold = [[UILabel alloc] initWithFrame:CGRectMake(80, 12, 100, 20)];
//        lblGold.text = @"625 Gold";
        lblGold.font = [UIFont systemFontOfSize:13];
        lblGold.textColor = [UIColor whiteColor];
        [lblGold sizeToFit];
        [self addSubview:lblGold];
        
        lblExtra = [[UILabel alloc] initWithFrame:CGRectMake(167, 12, 100, 20)];
        lblExtra.textColor = [UIColor colorWithRed:207/255.0 green:79/255.0 blue:0 alpha:1.0];
//        lblExtra.text = @"25% Extral!";
        lblExtra.font = [UIFont systemFontOfSize:13];
        [lblExtra sizeToFit];
        [self addSubview:lblExtra];
        
        lblMoney = [[UILabel alloc] initWithFrame:CGRectMake(278, 12, 100, 20)];
        lblMoney.textColor = [UIColor whiteColor];
//        lblMoney.text = @"$95.99";
        lblMoney.font = [UIFont systemFontOfSize:13];
        [lblMoney sizeToFit];
        [self addSubview:lblMoney];
        
        UIImage *imageBuy = [UIImage imageNamed:@"btnBuyGold"];
        btnBuy = [UIButton buttonWithType:UIButtonTypeCustom];
        btnBuy.frame = CGRectMake(349, 12, imageBuy.size.width, imageBuy.size.height);
        [btnBuy setImage:imageBuy forState:UIControlStateNormal];
        [btnBuy addTarget:self action:@selector(buyGold) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btnBuy];
        
    }
    return self;
}

- (void)buyGold {
    if ([_delegate respondsToSelector:@selector(buyGoldWithID:)]) {
        [_delegate buyGoldWithID:_tablePurchase.priceID];
    }
}

- (void)setTablePurchase:(LCTablePurchase *)tablePurchase {
    _tablePurchase = tablePurchase;
    int gold = tablePurchase.numCoin;
    
    if (tablePurchase.isPromotion) {
        gold = gold + tablePurchase.numCoin * tablePurchase.extra;
    }
    
    lblGold.text = [NSString stringWithFormat:@"$%d", tablePurchase.numUSD];
    [lblGold sizeToFit];
    
    lblMoney.text = [NSString stringWithFormat:@"%d Gold", gold];
    [lblMoney sizeToFit];
    
    if (tablePurchase.isPromotion) {
        lblExtra.text = [NSString stringWithFormat:@"%f%% Extral!", tablePurchase.extra];
        [lblExtra sizeToFit];
    } else {
        lblExtra.text = @"";
    }
}

@end
