//
//  User.m
//  SpriteDemo
//
//  Created by Le Cong on 12/13/14.
//  Copyright (c) 2014 Lê Công. All rights reserved.
//

#import "User.h"

@implementation User

- (id)initWithTotalCoin:(CGFloat)totalCoin andFreeCoin:(CGFloat)freeCoin {
    self = [super init];
    if (self) {
        _freeCoin = freeCoin;
        _totalCoin = totalCoin;
        _myCoin = _totalCoin - freeCoin;
    }
    return self;
}
@end
