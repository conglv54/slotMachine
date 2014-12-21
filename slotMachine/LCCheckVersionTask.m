//
//  LCCheckVersionTask.m
//  slotMachine
//
//  Created by Le Cong on 12/18/14.
//  Copyright (c) 2014 Le Cong. All rights reserved.
//

#import "LCCheckVersionTask.h"

@implementation LCCheckVersionTask

- (NSString *)method {
    return METHOD_GET;
}

- (NSString *)URL {
    return kCheckVersion;
}

- (id)parseDataWithResponse:(id)response {
    NSString *version = response[@"version"];
    return version;
}

#pragma mark - Debug

- (BOOL)isDeBug {
    return YES;
}

- (id)genResponse {
    NSDictionary *response = @{@"code":[NSNumber numberWithInt:0], @"data":@{@"version": [NSNumber numberWithInt:1]}};
    return response;
}
@end
