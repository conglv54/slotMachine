//
//  BuyGoldTableViewCell.h
//  SpriteDemo
//
//  Created by Le Cong on 12/12/14.
//  Copyright (c) 2014 Lê Công. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LCTablePurchase.h"

@protocol BuyGoldDelegate <NSObject>

- (void)buyGoldWithID:(int)priceID;

@end

@interface BuyGoldTableViewCell : UITableViewCell

@property (nonatomic, assign) id<BuyGoldDelegate> delegate;

- (void)setTablePurchase:(LCTablePurchase *)tablePurchase;

@end
