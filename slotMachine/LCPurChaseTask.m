//
//  LCPurChaseTask.m
//  slotMachine
//
//  Created by Le Cong on 12/18/14.
//  Copyright (c) 2014 Le Cong. All rights reserved.
//

#import "LCPurChaseTask.h"

@implementation LCPurChaseTask {
    int _priceID;
}

- (id)initWithPriceID:(int)priceID {
    self = [super init];
    if (self) {
        _priceID = priceID;
    }
    return self;
}

- (NSDictionary *)parameters {
    return @{kPriceID: [NSNumber numberWithInt:_priceID], kReceipt: @"Do some thing"};
}

- (void)uploadReceipt:(NSData *)receipt {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSString *url = [self finalUrl];
    [manager POST:url parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        [formData appendPartWithFileData:receipt
                                    name:kReceipt
                                fileName:@"receipt" mimeType:nil];
        
        [formData appendPartWithFormData:[[NSString stringWithFormat:@"%d", _priceID] dataUsingEncoding:NSUTF8StringEncoding]
                                    name:kPriceID];
        
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"Response: %@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

- (id)parseDataWithResponse:(id)response {
    return response;
}

- (NSString *)method {
    return METHOD_POST;
}

- (NSString *)URL {
    return kPurchase;
}

@end