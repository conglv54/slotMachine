//
//  User.m
//  SpriteDemo
//
//  Created by Le Cong on 12/13/14.
//  Copyright (c) 2014 Lê Công. All rights reserved.
//

#import "User.h"

@implementation User

- (id)initWithMyCoin:(CGFloat)myCoin andFreeCoin:(CGFloat)freeCoin {
    self = [super init];
    if (self) {
        _freeCoin = freeCoin;
        _myCoin = myCoin;
        _totalCoin = _myCoin + _freeCoin;
    }
    return self;
}

- (void)setFreeCoin:(CGFloat)freeCoin {
    _freeCoin = freeCoin;
    _totalCoin = _freeCoin + _myCoin;
}

@end
