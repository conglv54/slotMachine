//
//  BuyGoldTableViewCell.h
//  SpriteDemo
//
//  Created by Le Cong on 12/12/14.
//  Copyright (c) 2014 Lê Công. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BuyGoldDelegate <NSObject>

- (void)buyGoldWithIndex:(int)index;

@end

@interface BuyGoldTableViewCell : UITableViewCell

@property (nonatomic) int index;
@property (nonatomic, assign) id<BuyGoldDelegate> delegate;

@end
