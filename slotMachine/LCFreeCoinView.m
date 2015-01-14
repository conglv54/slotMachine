//
//  LCFreeCoinView.m
//  slotMachine
//
//  Created by Le Cong on 1/15/15.
//  Copyright (c) 2015 Le Cong. All rights reserved.
//

#import "LCFreeCoinView.h"

@implementation LCFreeCoinView

- (id)initWithFrame:(CGRect)frame andBGImage:(UIImage *)img {
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView *bgView = [[UIImageView alloc] initWithImage:img];
        bgView.frame = frame;
        [self addSubview:bgView];
        
        UIImage *bgImage = [UIImage imageNamed:@"btnClaim"];
        UIButton *btnClaim = [self buttonWithFrame:CGRectMake(0, 0, bgImage.size.width, bgImage.size.height) andBGImage:bgImage];

        UIImage *bgImgeClose = [UIImage imageNamed:@"btnCloseFreeCon"];
        UIButton *btnClose = [self buttonWithFrame:CGRectMake(40, 60, bgImage.size.width, bgImage.size.height) andBGImage:bgImgeClose];
        
        [self addSubview:btnClaim];
        [self addSubview:btnClose];
    }
    return self;
}

- (UIButton *)buttonWithFrame:(CGRect)frame andBGImage:(UIImage *)bgImage {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = frame;
    [btn setImage:bgImage forState:UIControlStateNormal];
    return btn;
}
@end
