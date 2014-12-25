//
//  LCRegisterTask.m
//  slotMachine
//
//  Created by Le Cong on 12/18/14.
//  Copyright (c) 2014 Le Cong. All rights reserved.
//

#import "LCRegisterTask.h"
#import "HARegister.h"

@implementation LCRegisterTask

- (NSString *)method {
    return METHOD_POST;
}

- (NSString *)URL {
    return kRegister;
}

- (id)parseDataWithResponse:(id)response {
    HARegister *haregister = [[HARegister alloc] init];
    HAUser *user = [[HAUser alloc] init];
    NSString *session_id = response[kSessionID];
    
//    user.freeCoin = [response[@"free_coins_total"] intValue];
//    user.myCoin = [response[@"major_coins_total"] intValue];
    [user setFreeCoin:100];
    [user setMyCoin:6100];
    
    haregister.user = user;
    haregister.session_id = session_id;
    
    return haregister;
}

- (id)initWithDeviceID:(NSString *)deviceID {
    self = [super init];
    if (self) {
        self.isSession = NO;
        _deviceID = deviceID;
        _os = kOSType;
        _token = kTokenType;
    }
    
    return self;
}

- (NSDictionary *)parameters {
    return @{kDeviceID: _deviceID, kOS: [NSNumber numberWithInt:_os], kToken: _token};
}

#pragma mark - Debug

//- (BOOL)isDeBug {
//    return YES;
//}

- (id)genResponse {
    return @{@"code": [NSNumber numberWithInt:0], @"data": @{@"session_id": @"123456"}};
}

@end
