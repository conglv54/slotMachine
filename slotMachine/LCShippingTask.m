//
//  LCShippingTask.m
//  slotMachine
//
//  Created by Le Cong on 1/22/15.
//  Copyright (c) 2015 Le Cong. All rights reserved.
//

#import "LCShippingTask.h"

@implementation LCShippingTask

- (NSString *)method {
    return METHOD_POST;
}

- (NSString *)URL {
    return kShipping;
}

- (NSDictionary *)parameters {
    return @{@"first_name": _firstName, @"address": _address, @"state": _state, @"phone": _phone, @"last_name": _lastName, @"city": _city, @"country": _country, @"email": _email};
}

- (id)parseDataWithResponse:(id)response {
    return response;
}


@end
