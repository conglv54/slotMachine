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

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeInt:freeCoin forKey:kFreeCoin];
    [aCoder encodeInt:myCoin forKey:kMyCoin];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        freeCoin = [aDecoder decodeIntForKey:kFreeCoin];
        myCoin = [aDecoder decodeIntForKey:kMyCoin];
    }
    return self;
}
@end
