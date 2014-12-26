//
//  LCViewController.h
//  slotMachine
//

//  Copyright (c) 2014 Le Cong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SpriteKit/SpriteKit.h>
#import "LCMyScene.h"
#import "HAUser.h"
#import "UIBuyGoldVIew.h"

@interface LCViewController : UIViewController <LCMygameDelegate, BuyGoldDelegate>

@property (nonatomic, strong) HAUser *user;

@end
