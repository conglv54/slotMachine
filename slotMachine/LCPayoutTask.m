//
//  LCPayoutTask.m
//  
//
//  Created by Le Cong on 12/26/14.
//
//

#import "LCPayoutTask.h"

@implementation LCPayoutTask {
    NSString *_account;
    CGFloat _amount;
}

- (NSString *)URL {
    return kPayout;
}

- (id)initWithPayoutAccount:(NSString *)account andAmount:(CGFloat )amount {
    self = [super init];
    if (self) {
        _account = account;
        _amount = amount;
    }
    return self;
}

- (id)parseDataWithResponse:(id)response {
    return nil;
}

@end
