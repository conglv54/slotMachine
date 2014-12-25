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
    HAUser *user = [[HAUser alloc] init];
    user.freeCoin = [response[kFreeCoin] intValue];
    return user;
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
