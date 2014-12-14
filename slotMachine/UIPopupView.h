//
//  UIPopupView.h
//  SpriteDemo
//
//  Created by Le Cong on 12/11/14.
//  Copyright (c) 2014 Lê Công. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIPopupView : UIView

@property (nonatomic, strong) UIView *foregroundView;
@property (nonatomic, strong) UIView *backgroundView;
@property (nonatomic, strong) UIButton *btnClose;

- (void)showinView:(UIView *)view;
- (UIView *)viewForContentView;

@end
