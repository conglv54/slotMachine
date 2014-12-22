//
//  LCGetFreeCoin.m
//  slotMachine
//
//  Created by Le Cong on 12/18/14.
//  Copyright (c) 2014 Le Cong. All rights reserved.
//

#import "LCGetFreeCoin.h"

@implementation LCGetFreeCoin

- (BOOL)isDeBug {
    return YES;
}

- (id)parseDataWithResponse:(id)response {
    NSNumber *freeCoin = response[@"coin"];
    return freeCoin;
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
