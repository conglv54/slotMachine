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
        
        UIView *backgroundView = [[UIView alloc] initWithFrame:frame];
        backgroundView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
        
        UIImageView *forgroundView = [[UIImageView alloc] initWithFrame:CGRectMake(frame.size.width/2 - img.size.width/2, frame.size.height/2 - img.size.height/2, img.size.width, img.size.height)];
        forgroundView.image = img;
        
        UIImage *bgImage = [UIImage imageNamed:@"btnClaim"];
        UIButton *btnClaim = [self buttonWithFrame:CGRectMake(CGRectGetMidX(frame) - bgImage.size.width/2, 125, bgImage.size.width, bgImage.size.height) andBGImage:bgImage];

        UIImage *bgImgeClose = [UIImage imageNamed:@"btnCloseFreeCon"];
        UIButton *btnClose = [self buttonWithFrame:CGRectMake(CGRectGetMidX(frame) - bgImgeClose.size.width/2, 215, bgImage.size.width, bgImage.size.height)
                                        andBGImage:bgImgeClose];
        [btnClose addTarget:self action:@selector(closeView) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:backgroundView];
        [self addSubview:forgroundView];
        
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

- (void)closeView {
    [self removeFromSuperview];
}

@end
