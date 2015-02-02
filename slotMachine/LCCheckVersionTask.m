//
//  LCCheckVersionTask.m
//  slotMachine
//
//  Created by Le Cong on 12/18/14.
//  Copyright (c) 2014 Le Cong. All rights reserved.
//

#import "LCCheckVersionTask.h"
#import "LCCheckVersion.h"
#import "LCItem.h"
#import "LCItemBigwin.h"

@implementation LCCheckVersionTask

- (id)initWithVersion:(NSString *)version {
    self = [super init];
    if (self) {
        _version = version;
    }
    return self;
}

- (NSDictionary *)parameters {
    return @{kVersion:_version};
}

- (NSString *)method {
    return METHOD_POST;
}

- (NSString *)URL {
    return kCheckVersion;
}

- (BOOL)isShowLoading {
    return NO;
}

- (id)parseDataWithResponse:(id)response {
    LCCheckVersion *checkVersion = [[LCCheckVersion alloc] init];
    NSDictionary *dictSetting = response[@"settings"];

    NSMutableArray *items = [NSMutableArray new];
    NSDictionary *dictItems = response[@"items"];
    if (![dictItems isEqual:[NSNull null]]) {
        for (NSString *itemId in dictItems.allKeys) {
            LCItem *item = [LCItem new];
            item.item_id = [itemId intValue];
            item.name = [dictItems[itemId] lastPathComponent];
            item.pathUrl = dictItems[itemId];
            [items addObject:item];
        }
    }
    
    NSDictionary *dictItemsBigwin = response[@"items_set"];
    NSMutableArray *itemsBigwin = [NSMutableArray new];
    if (![dictItemsBigwin isEqual:[NSNull null]]) {
        for (NSString *itemId in dictItemsBigwin.allKeys) {
            LCItemBigwin *item = [LCItemBigwin new];
            item.item_id = [itemId intValue];
            item.name = [dictItems[itemId] lastPathComponent];
            [itemsBigwin addObject:item];
        }
    }
    
    checkVersion.items = items;
    checkVersion.itemsBigwin = itemsBigwin;
    checkVersion.version = response[kVersion][@"value"];
    checkVersion.isUpdate = [response[@"is_update"] boolValue];
    checkVersion.setting = dictSetting;
    checkVersion.pathFile = response[@"path"];
    
    return checkVersion;
}

#pragma mark - Debug

//- (BOOL)isDeBug {
//    return YES;
//}

- (id)genResponse {
    NSDictionary *response = @{@"code":[NSNumber numberWithInt:0], @"data":@{kVersion: @"20142312", @"is_update": [NSNumber numberWithBool:true], @"settings": @{kMaxBet: [NSNumber numberWithInt:50], kMinBet: [NSNumber numberWithInt:10], kStepBet: [NSNumber numberWithInt:5], kRatioPayout: [NSNumber numberWithInt:10]}}};
    return response;
}
@end
