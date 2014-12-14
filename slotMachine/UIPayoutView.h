//
//  UIPayoutView.h
//  SpriteDemo
//
//  Created by Le Cong on 12/12/14.
//  Copyright (c) 2014 Lê Công. All rights reserved.
//

#import "UIPopupView.h"

@interface UIPayoutView : UIPopupView <UITextFieldDelegate>

- (void)setTotalCoin:(CGFloat) totalCoin andFreeCoin:(CGFloat) freeCoin;

@end
