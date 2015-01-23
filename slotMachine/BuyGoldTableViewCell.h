//
//  BuyGoldTableViewCell.h
//  SpriteDemo
//
//  Created by Le Cong on 12/12/14.
//  Copyright (c) 2014 Lê Công. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LCTablePurchase.h"

@protocol BuyGoldCellDelegate <NSObject>

- (void)buyGoldWithID:(int)priceID andProductIndex:(int) index;

@end

@interface BuyGoldTableViewCell : UITableViewCell

@property (nonatomic, assign) id<BuyGoldCellDelegate> delegate;

@property (nonatomic) int index;

- (void)setTablePurchase:(LCTablePurchase *)tablePurchase;

@end
