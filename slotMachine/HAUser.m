//
//  HAUser.m
//  slotMachine
//
//  Created by Le Cong on 12/25/14.
//  Copyright (c) 2014 Le Cong. All rights reserved.
//

#import "HAUser.h"

@implementation HAUser

@synthesize totalCoin;
@synthesize freeCoin;
@synthesize myCoin;

- (int)totalCoin {
    return self.freeCoin + self.myCoin;
}

@end
