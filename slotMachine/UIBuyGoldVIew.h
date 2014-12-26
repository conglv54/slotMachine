//
//  UIBuyGoldVIew.h
//  SpriteDemo
//
//  Created by Le Cong on 12/11/14.
//  Copyright (c) 2014 Lê Công. All rights reserved.
//

#import "UIPopupView.h"
#import "BuyGoldTableViewCell.h"

@protocol BuyGoldDelegate <NSObject>

- (void)didBuyGold:(int)gold;

@end

@interface UIBuyGoldVIew : UIPopupView <UITableViewDataSource, UITableViewDelegate, BuyGoldCellDelegate>

@property (nonatomic, assign) id <BuyGoldDelegate> delegate;

@end
