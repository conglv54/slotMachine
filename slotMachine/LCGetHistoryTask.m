//
//  LCGetHistoryTask.m
//  slotMachine
//
//  Created by Le Cong on 12/18/14.
//  Copyright (c) 2014 Le Cong. All rights reserved.
//

#import "LCGetHistoryTask.h"
#import "LCHistory.h"

@implementation LCGetHistoryTask

- (NSString *)method {
    return METHOD_GET;
}

- (NSString *)URL {
    return kGetHistory;
}

#pragma mark - Debug

- (BOOL)isDeBug {
    return YES;
}

- (id)parseDataWithResponse:(id)response {
    NSMutableArray *histories = [NSMutableArray new];
    for (NSDictionary *dictHistory in response) {
        LCHistory *history = [[LCHistory alloc] init];
        history.date = dictHistory[@"date"];
        history.time = dictHistory[@"time"];
        history.bet = dictHistory[@"bet"];
        history.win = dictHistory[@"win"];
        [histories addObject:history];
    }
    return histories;
}

- (id)genResponse {
    NSMutableArray *arr = [NSMutableArray new];
    for (int i = 0 ; i < 10; i ++) {
        [arr addObject:@{@"date": [NSString stringWithFormat:@"%d-1-2015", i+ 1], @"time": @"09:09:09", @"bet": @"10", @"win": @"10"}];
    }
    return @{@"code": [NSNumber numberWithInt:0], @"data": arr};
}

@end
