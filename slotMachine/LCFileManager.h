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

- (void)setSettingDefault:(LCSetting *)setting;
- (LCSetting *)getSettingDefault;

- (void)setUser:(HAUser *)user;
- (HAUser *)getUser;

@end
