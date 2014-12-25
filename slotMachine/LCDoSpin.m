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

//- (BOOL)isDeBug {
//    return true;
//}

- (id)parseDataWithResponse:(id)response {
    LCSpin *spin = [LCSpin new];
    NSInteger coin = [response[@"coin"] integerValue];
    spin.coin = coin;
    NSArray *result = response[@"result"];
    spin.arrResult = result;
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
