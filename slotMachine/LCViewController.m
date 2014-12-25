//
//  LCViewController.m
//  slotMachine
//
//  Created by Le Cong on 12/14/14.
//  Copyright (c) 2014 Le Cong. All rights reserved.
//

#import "LCViewController.h"
#import "LCMyScene.h"

#import "UIBuyGoldVIew.h"
#import "UIPayoutView.h"
#import "UIHistoryView.h"

#import "UIView+Frame.h"

#import "LCGetFreeCoin.h"

@implementation LCViewController {
    LCMyScene *scene;
    
    UIBuyGoldVIew *buyGold;
    UIPayoutView *payOutView;
    UIHistoryView *historyView;
    
    UILabel *lblTotalCoin;
    UILabel *lblBet;
    UILabel *lblMaxBet;
    UILabel *lblWin;
    
    CGFloat bet;
    CGFloat maxBet;
    CGFloat minBet;
    CGFloat win;
    
    BOOL isHold;
    
    NSTimer *timer;
}


- (void)viewDidLoad
{
    [super viewDidLoad];

    maxBet = 90;
    minBet = 10;
    
    bet = 0;
    win = 0;
    
    UIImage *imgBg = [UIImage imageNamed:@"bg"];
    UIImageView *imvBg = [[UIImageView alloc]initWithImage:imgBg];
    [imvBg setNewFrame:CGRectMake(0, 0, 568, 320)];
    [self.view addSubview:imvBg];
    
    UIImage *imgLeft = [UIImage imageNamed:@"bgLeft"];
    UIImageView *imvLeft = [[UIImageView alloc] initWithImage:imgLeft];
    [imvLeft setNewFrame:CGRectMake(0, 45, imgLeft.size.width, imgLeft.size.height)];
    [self.view addSubview:imvLeft];
    
    UIImage *imgHeader = [UIImage imageNamed:@"bgHeader"];
    UIImageView *imvHeader = [[UIImageView alloc]initWithImage:imgHeader];
    imvHeader.frame = CGRectMake(0, 0, imgHeader.size.width, imgHeader.size.height);
    [self.view addSubview:imvHeader];
    
    UIImage *imgFreeCoin = [UIImage imageNamed:@"btnFreeCoin"];
    UIButton *btnFreeCoin = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnFreeCoin setImage:imgFreeCoin forState:UIControlStateNormal];
    [btnFreeCoin addTarget:self action:@selector(getFreeCoin) forControlEvents:UIControlEventTouchUpInside];
    [btnFreeCoin setNewFrame:CGRectMake(101, 22, imgFreeCoin.size.width, imgFreeCoin.size.height)];
    [self.view addSubview:btnFreeCoin];
    
    UIImage *imgMoney = [UIImage imageNamed:@"bgMoney"];
    UIImageView *imvMoney = [[UIImageView alloc]initWithImage:imgMoney];
    [imvMoney setNewFrame:CGRectMake(242, 20, imgMoney.size.width, imgMoney.size.height)];
    [self.view addSubview:imvMoney];
    
    UIImage *imgPayout = [UIImage imageNamed:@"btnPayout"];
    UIButton *btnPayout = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnPayout setImage:imgPayout forState:UIControlStateNormal];
    [btnPayout setNewFrame:CGRectMake(388, 23, imgPayout.size.width, imgPayout.size.height)];
    [btnPayout addTarget:self action:@selector(payOut) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnPayout];
    
    UIImage *imgBuy = [UIImage imageNamed:@"btnBuy"];
    UIButton *btnBuy = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnBuy setImage:imgBuy forState:UIControlStateNormal];
    [btnBuy setNewFrame:CGRectMake(484, 137, imgBuy.size.width, imgBuy.size.height)];
    [btnBuy addTarget:self action:@selector(BuyCoint:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnBuy];
    
    UIImage *imgShop = [UIImage imageNamed:@"btnShop"];
    UIButton *btnShop = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnShop setImage:imgShop forState:UIControlStateNormal];
    [btnShop setNewFrame:CGRectMake(484, 190, imgShop.size.width, imgShop.size.height)];
    [self.view addSubview:btnShop];
    
    UIImage *imgRight = [UIImage imageNamed:@"bgRight"];
    UIImageView *imvRight = [[UIImageView alloc] initWithImage:imgRight];
    [imvRight setNewFrame:CGRectMake(475, 42, imgRight.size.width, imgRight.size.height)];
    [self.view addSubview:imvRight];
    
    UIImage *imgHistory = [UIImage imageNamed:@"btnHistory"];
    UIButton *btnHistory = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnHistory setImage:imgHistory forState:UIControlStateNormal];
    [btnHistory addTarget:self action:@selector(showHistory) forControlEvents:UIControlEventTouchUpInside];
    [btnHistory setNewFrame:CGRectMake(102, 263, imgHistory.size.width, imgHistory.size.height)];
    [self.view addSubview:btnHistory];
    
    UIImage *imgBet = [UIImage imageNamed:@"btnBet"];
    UIButton *btnBet = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnBet setImage:imgBet forState:UIControlStateNormal];
    [btnBet setNewFrame:CGRectMake(233, 289, imgBet.size.width, imgBet.size.height)];
    [btnBet addTarget:self action:@selector(touchUpInSide) forControlEvents:UIControlEventTouchUpInside];
    [btnBet addTarget:self action:@selector(touchDown) forControlEvents:UIControlEventTouchDown];
    [btnBet addTarget:self action:@selector(touchUpOutSide) forControlEvents:UIControlEventTouchUpOutside];
    
    [self.view addSubview:btnBet];
    
    UIImage *imgMaxBet = [UIImage imageNamed:@"btnMaxBet"];
    UIButton *btnMaxBet = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnMaxBet setImage:imgMaxBet forState:UIControlStateNormal];
    [btnMaxBet setNewFrame:CGRectMake(290, 289, imgMaxBet.size.width, imgMaxBet.size.height)];
    [btnMaxBet addTarget:self action:@selector(setMaxBet) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnMaxBet];
    
    UIImage *imgSpin = [UIImage imageNamed:@"btnSpin"];
    UIButton *btnSpin = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnSpin setImage:imgSpin forState:UIControlStateNormal];
    [btnSpin addTarget:self action:@selector(spin:) forControlEvents:UIControlEventTouchUpInside];
    [btnSpin setNewFrame:CGRectMake(397, 289, imgSpin.size.width, imgSpin.size.height)];
    [self.view addSubview:btnSpin];
    
    UIImage *imgBgBet = [UIImage imageNamed:@"bgBet"];
    UIImageView *imvBet = [[UIImageView alloc] initWithImage:imgBgBet];
    [imvBet setNewFrame:CGRectMake(232, 263, imgBgBet.size.width, imgBgBet.size.height)];
    [self.view addSubview:imvBet];
    
    UIImage *imgBgMaxBet = [UIImage imageNamed:@"bgMaxBet"];
    UIImageView *imvMaxBet = [[UIImageView alloc] initWithImage:imgBgMaxBet];
    [imvMaxBet setNewFrame:CGRectMake(289, 263, imgBgMaxBet.size.width, imgBgMaxBet.size.height)];
    [self.view addSubview:imvMaxBet];
    
    UILabel *lblTitleTotalMaxbet = [[UILabel alloc] init];
    [lblTitleTotalMaxbet setNewFrame:CGRectMake(298, 268, 0, 0)];
    lblTitleTotalMaxbet.text = @"Total Bet";
    lblTitleTotalMaxbet.textColor = [UIColor colorWithRed:110/255.0 green:110/255.0 blue:110/255.0 alpha:1.0];
    lblTitleTotalMaxbet.font = [UIFont fontWithName:@"ArialRoundedMTBold" size:10];
    [lblTitleTotalMaxbet sizeToFit];
    [self.view addSubview:lblTitleTotalMaxbet];
    
    UIImage *imgBgWin = [UIImage imageNamed:@"bgWin"];
    UIImageView *imvWin = [[UIImageView alloc] initWithImage:imgBgWin];
    [imvWin setNewFrame:CGRectMake(396, 263, imgBgWin.size.width, imgBgWin.size.height)];
    [self.view addSubview:imvWin];
    
    UILabel *lblTitleWin = [[UILabel alloc] init];
    [lblTitleWin setNewFrame: CGRectMake(410, 268, 0, 0)];
    lblTitleWin.text = @"Win";
    lblTitleWin.textColor = [UIColor colorWithRed:110/255.0 green:110/255.0 blue:110/255.0 alpha:1.0];
    lblTitleWin.font = [UIFont fontWithName:@"ArialRoundedMTBold" size:10];
    [lblTitleWin sizeToFit];
    [self.view addSubview:lblTitleWin];
    
    _user = [[User alloc] initWithMyCoin:800 andFreeCoin:200];
    
    lblBet = [[UILabel alloc] init];
    [lblBet setNewFrame:CGRectMake(242, 268, 0, 0)];
    lblBet.text = [NSString stringWithFormat:@"%0.2f", minBet];
    lblBet.textColor = [UIColor whiteColor];
    lblBet.font = [UIFont fontWithName:@"ArialRoundedMTBold" size:10];
    [lblBet sizeToFit];
    [self.view addSubview:lblBet];
    
    lblTotalCoin = [[UILabel alloc] init];
    [lblTotalCoin setNewFrame:CGRectMake(272, 22, 80, 20)];
    lblTotalCoin.font = [UIFont fontWithName:@"ArialRoundedMTBold" size:10];
    lblTotalCoin.textColor = [UIColor whiteColor];
    lblTotalCoin.text = [Utils stringFromDouble:_user.totalCoin];
    [self.view addSubview:lblTotalCoin];
    
    lblMaxBet = [[UILabel alloc] init];
    [lblMaxBet setNewFrame:CGRectMake(350, 268, 0, 0)];
    lblMaxBet.text = [NSString stringWithFormat:@"%0.2f", minBet];
    lblMaxBet.textColor = [UIColor redColor];
    lblMaxBet.font = [UIFont fontWithName:@"ArialRoundedMTBold" size:10];
    [lblMaxBet sizeToFit];
    [self.view addSubview:lblMaxBet];
    
    lblWin = [[UILabel alloc] init];
    [lblWin setNewFrame:CGRectMake(430, 268, 0, 0)];
    lblWin.text = [NSString stringWithFormat:@"%0.2f", win];
    lblWin.textColor = [UIColor redColor];
    lblWin.font = [UIFont fontWithName:@"ArialRoundedMTBold" size:10];
    [lblWin sizeToFit];
    [self.view addSubview:lblWin];
    
    timer = [NSTimer scheduledTimerWithTimeInterval:1   target:self selector:@selector(increaseBet) userInfo:nil repeats:YES];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    [self initScene];
}

- (void)initScene {
    // Configure the view.
    SKView * skView = (SKView *)self.view;
    skView.showsFPS = YES;
    skView.showsNodeCount = YES;
    /* Sprite Kit applies additional optimizations to improve rendering performance */
    skView.ignoresSiblingOrder = YES;
    
    // Create and configure the scene.
    scene = [[LCMyScene alloc] initWithSize:skView.bounds.size];
    scene.scaleMode = SKSceneScaleModeAspectFill;
    
    // Present the scene.
    [skView presentScene:scene];
    
}

- (IBAction)spin:(id)sender {
    if (scene.isRote) {
        return;
    }
    
    scene.isAuto = !scene.isAuto;
    if (scene.isAuto) {
        [scene start];
    }
    
    
}

- (IBAction)BuyCoint:(id)sender {
    buyGold = [[UIBuyGoldVIew alloc] init];
    [buyGold showinView:self.view];
}

- (void)payOut {
    if (!payOutView) {
        payOutView = [[UIPayoutView alloc] init];
    }
    
    [payOutView setTotalCoin:_user.totalCoin andFreeCoin:_user.freeCoin];
    [payOutView showinView:self.view];
}

- (void)showHistory {
    if (!historyView) {
        historyView  = [[UIHistoryView alloc] init];
    }
    [historyView showinView:self.view];
}

- (void)increaseBet {
    
    if (isHold) {
        bet = bet + minBet;
        
        if (bet > maxBet) {
            bet = minBet;
        }
        
        lblBet.text = [NSString stringWithFormat:@"%0.2f", bet];
        lblMaxBet.text = [NSString stringWithFormat:@"%0.2f", bet];
        [lblBet sizeToFit];
        
        scene.bet = bet;
    }
}

- (void)touchDown {
    isHold = TRUE;
}

- (void)touchUpInSide {
    isHold = FALSE;
    bet = bet + minBet;
    
    if (bet > maxBet) {
        bet = minBet;
    }
    
    lblBet.text = [NSString stringWithFormat:@"%0.2f", bet];
    lblMaxBet.text = [NSString stringWithFormat:@"%0.2f", bet];
    [lblBet sizeToFit];
    
    scene.bet = bet;
}

- (void)touchUpOutSide {
    isHold = FALSE;
}

- (void)setMaxBet {
    bet = 0;
    lblBet.text = [NSString stringWithFormat:@"%0.2f", maxBet];
    lblMaxBet.text = [NSString stringWithFormat:@"%0.2f", maxBet];
    
    scene.bet = bet;
}

- (void)getFreeCoin {
    LCGetFreeCoin *getFreeCoin = [[LCGetFreeCoin alloc] init];
    [getFreeCoin requestWithBlockSucess:^(id sucess) {
        NSNumber *freeCoint = (NSNumber *)sucess;
        CGFloat oldCoin = _user.freeCoin;
        [_user setFreeCoin:oldCoin + [freeCoint intValue]];
        lblTotalCoin.text = [Utils stringFromDouble:_user.totalCoin];
    } andBlockFailure:^(id error) {
        
    }];
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    } else {
        return UIInterfaceOrientationMaskAll;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

@end
