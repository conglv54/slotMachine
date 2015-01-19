//
//  LCDoSpin.m
//  slotMachine
//
//  Created by Le Cong on 12/18/14.
//  Copyright (c) 2014 Le Cong. All rights reserved.
//

#import "LCDoSpin.h"
#import "LCSpin.h"

@implementation LCDoSpin

- (id)init {
    self = [super init];
    if (self) {
        self.isShowLoading = false;
    }
    return self;
}

- (id)parseDataWithResponse:(id)response {
    LCSpin *spin = [LCSpin new];
    NSInteger coin = [response[@"coins"] integerValue];
    spin.coin = coin;
    
    NSArray *result = response[@"range"];
    spin.arrResult = result;
    
    NSSet *set = [NSSet setWithArray:result];
    if (set.count == 1) {
        spin.isBigWin = true;
    } else {
        spin.isBigWin = false;
    }
    
    spin.winType = [response[@"item_type"] intValue];
    
    return spin;
}

- (id)genResponse {
    NSArray *arrayResult = @[[NSNumber numberWithInt:1], [NSNumber numberWithInt:1], [NSNumber numberWithInt:1], [NSNumber numberWithInt:1], [NSNumber numberWithInt:1]];
    return @{@"code": [NSNumber numberWithInt:0], @"data": @{@"coin": [NSNumber numberWithInt:100], @"result": arrayResult}};
}

- (void)setBet:(NSInteger)bet {
    self.parameters = @{@"bet": [NSNumber numberWithInteger:bet]};
}

- (NSString *)method {
    return METHOD_POST;
}

- (NSString *)URL {
    return kDoSpin;
}

@end
