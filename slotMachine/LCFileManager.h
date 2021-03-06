//
//  LCFileManager.h
//  slotMachine
//
//  Created by Lê Công on 12/24/14.
//  Copyright (c) 2014 Le Cong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LCSetting.h"
#import "HAUser.h"

@interface LCFileManager : NSObject

+ (LCFileManager *)shareInstance;

- (void)saveSessionID:(NSString *)sessionID;
- (NSString *)getSessionID;

- (void)setIsFirstLaunch:(BOOL)isFirstLaunch;
- (BOOL)isFirstLaunch;

- (void)setVersion:(NSString *)version;
- (NSString *)getVersion;

- (void)setSettingDefault:(NSDictionary *)setting;
- (LCSetting *)getSettingDefault;

- (void)setUserWithFreeCoin:(int) freeCoin andTotalCoin:(int) totalCoin;
- (HAUser *)getUser;

- (void)setFreeTime:(CGFloat)time;
- (CGFloat)getFreeTime;

// Item

- (void)setItems:(NSArray *)items;
- (NSArray *)getItems;

/// Item Path

- (void)setItemsBigwin:(NSArray *)items;
- (NSArray *)getItemsBigwin;

// document file path

- (NSString *)documentDirectory;

@end
