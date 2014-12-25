//
//  LCFileManager.m
//  slotMachine
//
//  Created by Lê Công on 12/24/14.
//  Copyright (c) 2014 Le Cong. All rights reserved.
//

#import "LCFileManager.h"

@implementation LCFileManager {
    NSMutableDictionary *dictDefault;
}

+ (LCFileManager *)shareInstance {
    static LCFileManager *_shareInstance = nil;
    static dispatch_once_t onePredicate;
    dispatch_once(&onePredicate, ^{
        _shareInstance = [[LCFileManager alloc] init];
    });
    return _shareInstance;
}

- (id)init {
    self = [super init];
    if (self) {
        dictDefault = [self readDict];
    }
    return self;
}

#pragma mark - Public method

//session

- (void)saveSessionID:(NSString *)sessionID {
    [dictDefault setObject:sessionID forKey:kSessionID];
    [dictDefault writeToFile:[self filePath] atomically:YES];
}

- (NSString *)getSessionID {
    return dictDefault[kSessionID];
}

// is first launch

- (void)setIsFirstLaunch:(BOOL)isFirstLaunch {
    [dictDefault setObject:[NSNumber numberWithBool:isFirstLaunch] forKey:kIsFirstlaunch];
    [dictDefault writeToFile:[self filePath] atomically:YES];
}

- (BOOL)isFirstLaunch {
    BOOL isFirstLaunch = [dictDefault[kIsFirstlaunch] boolValue];
    return isFirstLaunch;
}

// version

- (void)setVersion:(NSString *)version {
    [dictDefault setObject:version forKey:kVersion];
    [dictDefault writeToFile:[self filePath] atomically:YES];
}

- (NSString *)getVersion {
    return dictDefault[kVersion];
}

// setting

- (void)setSettingDefault:(LCSetting *)setting {
    [dictDefault setObject:[NSNumber numberWithInt:setting.maxBet] forKey:kMaxBet];
    [dictDefault setObject:[NSNumber numberWithInt:setting.minBet] forKey:kMinBet];
    [dictDefault setObject:[NSNumber numberWithInt:setting.stepBet] forKey:kStepBet];
    [dictDefault setObject:[NSNumber numberWithInt:setting.ratioPayout] forKey:kMaxBet];
    [dictDefault writeToFile:[self filePath] atomically:YES];
}

- (LCSetting *)getSettingDefault {
    LCSetting *setting = [[LCSetting alloc] init];
    setting.maxBet = [dictDefault[kMaxBet] intValue];
    setting.minBet = [dictDefault[kMinBet] intValue];
    setting.stepBet = [dictDefault[kStepBet] intValue];
    setting.ratioPayout = [dictDefault[kRatioPayout] intValue];
    return setting;
}

// User

- (void)setUser:(HAUser *)user {
    [dictDefault setObject:[NSNumber numberWithInt:user.freeCoin] forKey:kFreeCoin];
    [dictDefault setObject:[NSNumber numberWithInt:user.myCoin] forKey:kMyCoin];
}

- (HAUser *)getUser {
    HAUser *user = [HAUser new];
    user.freeCoin = [dictDefault[kFreeCoin] intValue];
    user.myCoin = [dictDefault[kMyCoin] intValue];
    return user;
}

#pragma mark - Private Method

- (NSMutableDictionary *)readDict{
    NSMutableDictionary *contentDict = [NSMutableDictionary dictionaryWithContentsOfFile:[self filePath]];
    return contentDict;
}

- (NSString*)filePath
{
    NSArray *Paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *DocumentDir = [Paths objectAtIndex:0];
    return [DocumentDir stringByAppendingPathComponent:kDefaultFileName];
}

@end
