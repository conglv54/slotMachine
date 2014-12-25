//
//  LCPurChaseTask.m
//  slotMachine
//
//  Created by Le Cong on 12/18/14.
//  Copyright (c) 2014 Le Cong. All rights reserved.
//

#import "LCPurChaseTask.h"

@implementation LCPurChaseTask {
    int _priceID;
}

- (id)initWithPriceID:(int)priceID {
    self = [super init];
    if (self) {
        _priceID = priceID;
    }
    return self;
}

- (NSDictionary *)parameters {
    return @{kPriceID: [NSNumber numberWithInt:_priceID], kReceipt: @"Do some thing"};
}

- (NSString *)method {
    return METHOD_POST;
}

- (NSString *)URL {
    return kPurchase;
}

@end