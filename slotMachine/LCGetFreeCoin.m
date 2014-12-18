//
//  LCGetFreeCoin.m
//  slotMachine
//
//  Created by Le Cong on 12/18/14.
//  Copyright (c) 2014 Le Cong. All rights reserved.
//

#import "LCGetFreeCoin.h"

@implementation LCGetFreeCoin

- (NSString *)method {
    return METHOD_GET;
}

- (NSString *)URL {
    return kGetFreeCoin;
}

@end
