//
//  UIPayoutView.m
//  SpriteDemo
//
//  Created by Le Cong on 12/12/14.
//  Copyright (c) 2014 Lê Công. All rights reserved.
//

#import "UIPayoutView.h"
#import "LCPayoutTask.h"
#import "LCFileManager.h"

@implementation UIPayoutView {
    UILabel *lblTotalCoins;
    UILabel *lblFreeCoins;
    UILabel *lblMyCoins;
    UILabel *lblMaxPayout;
    
    UITextField *txtPaypalAccount;
    UITextField *txtAmount;
    
    UIButton *btnRequestPayout;
    
    CGFloat maxPayout;
}

- (UIView *)viewForContentView {
    UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(54, 30, 460, 243)];
    
    UILabel *lblTitle = [[UILabel alloc] initWithFrame:CGRectMake(190, 19, 83, 30)];
    lblTitle.text = @"PAY OUT";
    lblTitle.font = [UIFont systemFontOfSize:18];
    lblTitle.textColor = [UIColor whiteColor];
    [lblTitle sizeToFit];
    
    UILabel *lblTitleTotalCoin = [[UILabel alloc] initWithFrame:CGRectMake(42, 60, 83, 30)];
    lblTitleTotalCoin.text = @"TOTAL COINS";
    lblTitleTotalCoin.font = [UIFont systemFontOfSize:13];
    lblTitleTotalCoin.textColor = [UIColor colorWithRed:207/255.0 green:79/255.0 blue:0 alpha:1.0];
    [lblTitleTotalCoin sizeToFit];
    
    lblTotalCoins = [[UILabel alloc] initWithFrame:CGRectMake(153, 60, 83, 30)];
    lblTotalCoins.text = @"1050";
    lblTotalCoins.font = [UIFont systemFontOfSize:13];
    lblTotalCoins.textColor = [UIColor whiteColor];
    [lblTotalCoins sizeToFit];


    UILabel *lblTitleMyCoins = [[UILabel alloc] initWithFrame:CGRectMake(244, 60, 83, 30)];
    lblTitleMyCoins.text = @"YOUR COINS";
    lblTitleMyCoins.font = [UIFont systemFontOfSize:13];
    lblTitleMyCoins.textColor = [UIColor colorWithRed:207/255.0 green:79/255.0 blue:0 alpha:1.0];
    [lblTitleMyCoins sizeToFit];
    
    lblMyCoins = [[UILabel alloc] initWithFrame:CGRectMake(360, 60, 83, 30)];
    lblMyCoins.text = @"650";
    lblMyCoins.font = [UIFont systemFontOfSize:13];
    lblMyCoins.textColor = [UIColor whiteColor];
    [lblMyCoins sizeToFit];
    
    UILabel *lblTitleFreeCoin = [[UILabel alloc] initWithFrame:CGRectMake(42, 83, 83, 30)];
    lblTitleFreeCoin.text = @"FREE COINS";
    lblTitleFreeCoin.font = [UIFont systemFontOfSize:13];
    lblTitleFreeCoin.textColor = [UIColor colorWithRed:207/255.0 green:79/255.0 blue:0 alpha:1.0];
    [lblTitleFreeCoin sizeToFit];
    
    lblFreeCoins = [[UILabel alloc] initWithFrame:CGRectMake(153, 83, 83, 30)];
    lblFreeCoins.text = @"400";
    lblFreeCoins.font = [UIFont systemFontOfSize:13];
    lblFreeCoins.textColor = [UIColor whiteColor];
    [lblFreeCoins sizeToFit];

    UILabel *lblTitleMaxPayout = [[UILabel alloc] initWithFrame:CGRectMake(244, 83, 83, 30)];
    lblTitleMaxPayout.text = @"MAX PAYOUT";
    lblTitleMaxPayout.font = [UIFont systemFontOfSize:13];
    lblTitleMaxPayout.textColor = [UIColor colorWithRed:207/255.0 green:79/255.0 blue:0 alpha:1.0];
    [lblTitleMaxPayout sizeToFit];
    
    lblMaxPayout = [[UILabel alloc] initWithFrame:CGRectMake(360, 83, 83, 30)];
    lblMaxPayout.text = @"$6";
    lblMaxPayout.font = [UIFont systemFontOfSize:13];
    lblMaxPayout.textColor = [UIColor whiteColor];
    [lblMaxPayout sizeToFit];
    
    UILabel *lblTitlePaypalAccount = [[UILabel alloc] initWithFrame:CGRectMake(42, 115, 83, 30)];
    lblTitlePaypalAccount.text = @"Paypal Account";
    lblTitlePaypalAccount.font = [UIFont systemFontOfSize:13];
    lblTitlePaypalAccount.textColor = [UIColor colorWithRed:207/255.0 green:79/255.0 blue:0 alpha:1.0];
    [lblTitlePaypalAccount sizeToFit];
    
    UIImage *bgPaypalAcc = [UIImage imageNamed:@"bgTxtPaypalAcc"];
    
    txtPaypalAccount = [[UITextField alloc] initWithFrame:CGRectMake(145, 113, 155, 16)];
    txtPaypalAccount.delegate = self;
    txtPaypalAccount.backgroundColor = [UIColor colorWithPatternImage:bgPaypalAcc];
    
    UILabel *lblTitleAmount = [[UILabel alloc] initWithFrame:CGRectMake(42, 141, 83, 30)];
    lblTitleAmount.text = @"Amount";
    lblTitleAmount.font = [UIFont systemFontOfSize:13];
    lblTitleAmount.textColor = [UIColor colorWithRed:207/255.0 green:79/255.0 blue:0 alpha:1.0];
    [lblTitleAmount sizeToFit];

    UIImage *bgAmount = [UIImage imageNamed:@"bgTxtAmount"];
    txtAmount = [[UITextField alloc] initWithFrame:CGRectMake(145, 141, 50, 16)];
    txtAmount.delegate = self;
    txtAmount.backgroundColor = [UIColor colorWithPatternImage:bgAmount];

    UIImage *imgRequest = [UIImage imageNamed:@"bgRequest"];
    btnRequestPayout = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnRequestPayout setImage:imgRequest forState:UIControlStateNormal];
    btnRequestPayout.frame = CGRectMake(42, 180, imgRequest.size.width, imgRequest.size.height);
    [btnRequestPayout addTarget:self action:@selector(requestPayout) forControlEvents:UIControlEventTouchUpInside];

    [contentView addSubview:lblTitle];
    
    [contentView addSubview:lblTitleTotalCoin];
    [contentView addSubview:lblTotalCoins];
    
    [contentView addSubview:lblTitleMyCoins];
    [contentView addSubview:lblMyCoins]
    ;
    [contentView addSubview:lblTitleFreeCoin];
    [contentView addSubview:lblFreeCoins];
    
    [contentView addSubview:lblTitleMaxPayout];
    [contentView addSubview:lblMaxPayout];
    
    [contentView addSubview:lblTitlePaypalAccount];
    [contentView addSubview:txtPaypalAccount];
    
    [contentView addSubview:lblTitleAmount];
    [contentView addSubview:txtAmount];
    
    [contentView addSubview:btnRequestPayout];
    
    return contentView;
}

#pragma mark - Textfield Delegate 

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    [UIView animateWithDuration:0.5 animations:^{
        CGRect frame = self.foregroundView.frame;
        frame.origin.y = -100;
        self.foregroundView.frame = frame;
        
    } completion:^(BOOL finished) {
        
    }];
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if ([textField isEqual:txtPaypalAccount]) {
        [txtAmount becomeFirstResponder];
    } else if ([textField isEqual:txtAmount]){
        [self requestPayout];
        
    }
    return YES;
}

#pragma mark - ()

- (void)setTotalCoin:(CGFloat)totalCoin andFreeCoin:(CGFloat)freeCoin {
    lblTotalCoins.text = [NSString stringWithFormat:@"%0.f", totalCoin];
    lblFreeCoins.text  = [NSString stringWithFormat:@"%0.f", freeCoin];
    lblMyCoins.text    = [NSString stringWithFormat:@"%0.f", (totalCoin - freeCoin)];
    
    CGFloat ratioPayout = [[LCFileManager shareInstance]getSettingDefault].ratioPayout;
    maxPayout   = (totalCoin - freeCoin) / ratioPayout;
    
    lblMaxPayout.text  = [NSString stringWithFormat:@"%0.f", maxPayout];
    
    [lblTotalCoins sizeToFit];
    [lblFreeCoins sizeToFit];
    [lblMyCoins sizeToFit];
}

- (void)requestPayout {
    [txtAmount resignFirstResponder];
    [txtPaypalAccount resignFirstResponder];
    
    [UIView animateWithDuration:0.5 animations:^{
        CGRect frame = self.foregroundView.frame;
        frame.origin.y = 0;
        self.foregroundView.frame = frame;
        
    } completion:^(BOOL finished) {
        
    }];
    
    NSString *account = txtPaypalAccount.text;
    if ([account isEqualToString:@""]) {
        txtAmount.text = @"";
        return;
    }
    CGFloat amount = [txtAmount.text intValue];
    if (amount == 0 || amount > maxPayout) {
        txtAmount.text = @"";
        return;
    }
    
    LCPayoutTask *payoutTask = [[LCPayoutTask alloc] initWithPayoutAccount:account andAmount:amount];
    [payoutTask requestWithBlockSucess:^(id sucess) {
//        [self setTotalCoin:<#(CGFloat)#> andFreeCoin:<#(CGFloat)#>]
//        [LCFileManager shareInstance] setUser:<#(NSDictionary *)#>
    } andBlockFailure:^(id error) {
        
    }];
}


@end
