//
//  LCFreeCoinView.m
//  slotMachine
//
//  Created by Le Cong on 1/15/15.
//  Copyright (c) 2015 Le Cong. All rights reserved.
//

#import "LCFreeCoinView.h"
#import "LCGetFreeCoin.h"
#import "Utils.h"
#import <MZTimerLabel.h>
#import "LCFileManager.h"

@implementation LCFreeCoinView {
    CGRect _frame;
    UIImage *_forgroundImage;
    MZTimerLabel *_lblCountDownTime;
}

- (id)initWithFrame:(CGRect)frame andBGImage:(UIImage *)img {
    
    _frame = frame;
    _forgroundImage = img;
    
    self = [super initWithFrame:frame];
    if (self) {
        [self initView];
        [self setCountDownTimeView:[[LCFileManager shareInstance] getFreeTime]];
    }
    return self;
}

- (void)initView {
    
    UIView *backgroundView = [[UIView alloc] initWithFrame:_frame];
    backgroundView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    
    UIImageView *forgroundView = [[UIImageView alloc] initWithFrame:CGRectMake(_frame.size.width/2 - _forgroundImage.size.width/2, _frame.size.height/2 - _forgroundImage.size.height/2, _forgroundImage.size.width, _forgroundImage.size.height)];
    forgroundView.image = _forgroundImage;
    
    UIImage *bgImage = [UIImage imageNamed:@"btnClaim"];
    UIButton *btnClaim = [self buttonWithFrame:CGRectMake(CGRectGetMidX(_frame) - bgImage.size.width/2, 125, bgImage.size.width, bgImage.size.height) andBGImage:bgImage];
    
    UIImage *bgImgeClose = [UIImage imageNamed:@"btnCloseFreeCon"];
    UIButton *btnClose = [self buttonWithFrame:CGRectMake(CGRectGetMidX(_frame) - bgImgeClose.size.width/2, 215, bgImage.size.width, bgImage.size.height)
                                    andBGImage:bgImgeClose];
    [btnClose addTarget:self action:@selector(closeView) forControlEvents:UIControlEventTouchUpInside];
    
    _lblCountDownTime = [[MZTimerLabel alloc] initWithTimerType:MZTimerLabelTypeTimer];
    _lblCountDownTime.frame = CGRectMake(250, 180, 0, 0);
    _lblCountDownTime.textColor = [UIColor whiteColor];
    
    [self addSubview:backgroundView];
    [self addSubview:forgroundView];
    
    [self addSubview:btnClaim];
    [self addSubview:btnClose];
    
    [self addSubview:_lblCountDownTime];
}

- (void)getFreeCoin {
    LCGetFreeCoin *getFreeCoin = [[LCGetFreeCoin alloc] init];
    [getFreeCoin requestWithBlockSucess:^(id sucess) {
        int freeCoin = [sucess[@"free_coin"] intValue];
        int freeCoinTotal = [sucess[@"free_coins_total"] intValue];
        int currentTotalCoin = [[LCFileManager shareInstance]getUser].totalCoin;
        int totalCoin = freeCoin + currentTotalCoin;
        
        [[LCFileManager shareInstance] setUserWithFreeCoin:freeCoinTotal andTotalCoin:totalCoin];
        NSDate *date = [Utils dateFromString:sucess[@"next_time"]];
        [self setCountDownTime:date];
//        [_user setFreeCoin:[freeCoint intValue]];
//        lblTotalCoin.text = [Utils stringFromDouble:_user.totalCoin];
    } andBlockFailure:^(id error) {
        
    }];
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

- (void)setCountDownTimeView:(CGFloat)time {
    [_lblCountDownTime setCountDownTime:time];
    [_lblCountDownTime sizeToFit];
    [_lblCountDownTime start];
}

- (void)setCountDownTime:(NSDate *)date {
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:(NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit) fromDate:date];
    NSInteger hour = [components hour];
    NSInteger minute = [components minute];
    NSInteger second = [components second];
    
    CGFloat time = hour *60 * 60 + minute * 60 + second;
    
    [_lblCountDownTime setCountDownTime:time];
    [_lblCountDownTime sizeToFit];
    [_lblCountDownTime start];
}

@end
