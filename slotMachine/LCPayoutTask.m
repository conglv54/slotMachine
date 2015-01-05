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

- (NSString *)method {
    return METHOD_POST;
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

- (NSDictionary *)parameters {
    return @{kPaypal_account: _account, kAmount: [NSNumber numberWithFloat:_amount]};
}

- (id)parseDataWithResponse:(id)response {
    return nil;
}

@end
