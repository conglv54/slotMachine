//
//  LCConstant.h
//  slotMachine
//
//  Created by Le Cong on 12/21/14.
//  Copyright (c) 2014 Le Cong. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kDefaultFileName @"Default.plist"
#define kIsFirstlaunch @"isFirstLaunch"
#define kVersion @"version"

#define kMaxBet @"maxBet"
#define kMinBet @"minBet"
#define kStepBet @"stepBet"
#define kRatioPayout @"ratioPayout"

#define kDeviceID @"udid"
#define kOS @"os"
#define kToken @"token"

#define kOSType 1
#define kTokenType @"token"

#define kSessionID @"session_id"

#define kFreeCoin @"freeCoin"
#define kMyCoin @"myCoin"

#define kItems @"items"

#define kItemName @"itemName"
#define kItemID @"itemID"

#define rgb(r, g, b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]

@interface LCConstant : NSObject

@end
