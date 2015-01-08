//
//  LCFileManager.m
//  slotMachine
//
//  Created by Lê Công on 12/24/14.
//  Copyright (c) 2014 Le Cong. All rights reserved.
//

#import "LCFileManager.h"
#import "LCItem.h"

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

- (NSString *)documentDirectory {
    NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [documentDirectories firstObject];
    return documentDirectory;
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

- (void)setSettingDefault:(NSDictionary *)setting {
    [dictDefault setObject:setting[@"MAXBET"] forKey:kMaxBet];
    [dictDefault setObject:setting[@"MINBET"] forKey:kMinBet];
    [dictDefault setObject:setting[@"STEBET"] forKey:kStepBet];
    [dictDefault setObject:setting[@"RTEOUT"] forKey:kRatioPayout];
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

// Item

- (NSArray *)getItems {
    NSString *path = [self itemArchivePath];
    return [NSKeyedUnarchiver unarchiveObjectWithFile:path];
}

- (void)setItems:(NSArray *)items {
    NSString *path = [self itemArchivePath];
    BOOL isSucess = [NSKeyedArchiver archiveRootObject:items toFile:path];
    if (!isSucess) {
        NSLog(@"Not Save");
    }
}
// User

- (void)setUser:(NSDictionary *)userDict {
    [dictDefault setObject:userDict[@"free_coins_total"] forKey:kFreeCoin];
    [dictDefault setObject:userDict[@"major_coins_total"] forKey:kMyCoin];
    [dictDefault writeToFile:[self filePath] atomically:YES];
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

- (NSString*)filePath {
    NSString *DocumentDir = [self documentDirectory];
    return [DocumentDir stringByAppendingPathComponent:kDefaultFileName];
}

- (NSString *)itemArchivePath {
    NSString *documentDirectory = [self documentDirectory];
    return [documentDirectory stringByAppendingPathComponent:@"items.archive"];
}

@end
