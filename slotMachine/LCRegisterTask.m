//
//  LCRegisterTask.m
//  slotMachine
//
//  Created by Le Cong on 12/18/14.
//  Copyright (c) 2014 Le Cong. All rights reserved.
//

#import "LCRegisterTask.h"

@implementation LCRegisterTask

- (NSString *)method {
    return METHOD_POST;
}

- (NSString *)URL {
    return kRegister;
}

- (id)parseDataWithResponse:(id)response {
    NSString *session = response[kSessionID];
    return session;
}

- (id)initWithDeviceID:(NSString *)deviceID {
    self = [super init];
    if (self) {
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

- (BOOL)isDeBug {
    return YES;
}

- (id)genResponse {
    return @{@"code": [NSNumber numberWithInt:0], @"data": @{@"session_id": @"123456"}};
}

@end
