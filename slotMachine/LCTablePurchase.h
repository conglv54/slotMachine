//
//  LCTablePurchase.h
//  slotMachine
//
//  Created by Lê Công on 12/25/14.
//  Copyright (c) 2014 Le Cong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LCTablePurchase : NSObject

@property (nonatomic) float extra;

@property (nonatomic) int priceID;
@property (nonatomic) int numCoin;
@property (nonatomic) int numUSD;
@property (nonatomic) BOOL isPromotion;

@end
