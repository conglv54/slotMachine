//
//  LCGetFreeCoin.m
//  slotMachine
//
//  Created by Le Cong on 12/18/14.
//  Copyright (c) 2014 Le Cong. All rights reserved.
//

#import "LCGetFreeCoin.h"
#import "HAUser.h"

@implementation LCGetFreeCoin

- (id)parseDataWithResponse:(id)response {
    NSMutableDictionary *dict = [NSMutableDictionary new];
    [dict setObject:response[@"free_coins_total"] forKey:@"free_coins_total"];
    [dict setObject:response[@"next_time"] forKey:@"next_time"];
    return dict;
}

- (id)genResponse {
    return @{@"code": [NSNumber numberWithInt:0], @"data": @{@"coin": [NSNumber numberWithInt:100]}};
}

- (NSString *)method {
    return METHOD_GET;
}

- (NSString *)URL {
    return kGetFreeCoin;
}

@end
