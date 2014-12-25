//
//  LCGetTablePurchaseTask.m
//  slotMachine
//
//  Created by Lê Công on 12/25/14.
//  Copyright (c) 2014 Le Cong. All rights reserved.
//

#import "LCGetTablePurchaseTask.h"
#import "LCTablePurchase.h"

@implementation LCGetTablePurchaseTask

- (NSString *)method {
    return METHOD_GET;
}

- (NSString *)URL {
    return kPurchase;
}

- (id)parseDataWithResponse:(id)response {
    NSMutableArray *arr = [NSMutableArray new];
    BOOL isPromotion = [response[@"is_promotion"] boolValue];
    
    for (NSDictionary *dict in response[@"list"]) {
        LCTablePurchase *list = [LCTablePurchase new];
        
        list.isPromotion = isPromotion;
        
        list.priceID = [dict[@"id"] intValue];
        list.numCoin = [dict[@"num_coins"] intValue];
        list.numUSD = [dict[@"num_usd"] intValue];
        list.extra = [dict[@"promotion_rate"] floatValue];
        
        [arr addObject:list];        
    }

    return arr;
}

@end
