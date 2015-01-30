//
//  LCPurChaseTask.h
//  slotMachine
//
//  Created by Le Cong on 12/18/14.
//  Copyright (c) 2014 Le Cong. All rights reserved.
//

#import "LCBaseTaskNetWork.h"

@interface LCPurChaseTask : LCBaseTaskNetWork

- (id)initWithPriceID:(int)priceID andReceipt:(NSString *)data;

- (void)uploadReceipt:(NSData *)receipt;

@end
