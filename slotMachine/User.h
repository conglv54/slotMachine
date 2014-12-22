//
//  User.h
//  SpriteDemo
//
//  Created by Le Cong on 12/13/14.
//  Copyright (c) 2014 Lê Công. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (nonatomic) CGFloat totalCoin;
@property (nonatomic) CGFloat freeCoin;
@property (nonatomic) CGFloat myCoin;
@property (nonatomic, strong) NSString *payoutAccount;

- (id)initWithMyCoin:(CGFloat)myCoin andFreeCoin:(CGFloat)freeCoin;

@end
