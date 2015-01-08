//
//  HAUser.h
//  slotMachine
//
//  Created by Le Cong on 12/25/14.
//  Copyright (c) 2014 Le Cong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HAUser : NSObject <NSCoding>

@property (nonatomic) int totalCoin;
@property (nonatomic) int freeCoin;
@property (nonatomic) int myCoin;

@property (nonatomic, strong) NSString *payoutAccount;


@end
