//
//  UIPopupView.m
//  SpriteDemo
//
//  Created by Le Cong on 12/11/14.
//  Copyright (c) 2014 Lê Công. All rights reserved.
//

#import "UIPopupView.h"

@implementation UIPopupView 

- (id)init {
    self = [super init];
    if (self) {
        [self initCompoment];
        [self sentRequest];
    }
    return self;
}

- (void)initCompoment {
    _contentView = [[UIView alloc] initWithFrame:CGRectMake(54, 30, 460, 243)];
    
    _backgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 568, 320)];
    _backgroundView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];

    _foregroundView = [[UIView alloc] initWithFrame:CGRectMake(0, -320, 568, 320)];
    _foregroundView.backgroundColor = [UIColor clearColor];
    
    UIImage *imageClose = [UIImage imageNamed:@"btnClose"];
    _btnClose = [UIButton buttonWithType:UIButtonTypeCustom];
    _btnClose.frame = CGRectMake(54, 284, imageClose.size.width, imageClose.size.height);
    [_btnClose setImage:imageClose forState:UIControlStateNormal];
    [_btnClose addTarget:self action:@selector(closeView) forControlEvents:UIControlEventTouchUpInside];
    
    UIImage *bgContentView = [UIImage imageNamed:@"bgPopupView"];
    UIImageView *imvBgContentView = [[UIImageView alloc] initWithImage:bgContentView];
    imvBgContentView.frame = CGRectMake(54, 0, bgContentView.size.width, bgContentView.size.height);
    [_foregroundView addSubview:imvBgContentView];
    
    [_foregroundView addSubview:_btnClose];
    
    [_foregroundView addSubview:[self viewForContentView]];
}

- (UIView *)viewForContentView {
    return nil;
}

- (void)sentRequest {
    
}

- (void)showinView:(UIView *)view {
    
    [view addSubview:_backgroundView];
    [view addSubview:_foregroundView];
    
    [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        CGRect frame = _foregroundView.frame;
        frame.origin.y = 0;
        _foregroundView.frame = frame;
    } completion:^(BOOL finished) {
    }];
}

- (void)closeView {
    [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        CGRect frame = _foregroundView.frame;
        frame.origin.y = -320;
        _foregroundView.frame = frame;
    } completion:^(BOOL finished) {
        [_foregroundView removeFromSuperview];
        [_backgroundView removeFromSuperview];
        [self removeFromSuperview];
    }];
}

@end
