//
//  LCBaseTaskNetWork.m
//  slotMachine
//
//  Created by Le Cong on 12/18/14.
//  Copyright (c) 2014 Le Cong. All rights reserved.
//

#import "LCBaseTaskNetWork.h"
#import <AFNetworking.h>

NSString *const METHOD_GET = @"GET";
NSString *const METHOD_PUSH = @"PUSH";

NSString *const METHOD_POST = @"POST";
NSString *const METHOD_DELETE = @"DELETE";

NSString *const DOWNLOAD = @"DELETE";

NSString *const HOST_URL = @"http://example.com/api";

NSString *const kSession = @"session";

@implementation LCBaseTaskNetWork

- (id)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)requestWithBlockSucess:(BlockSucess)sucess andBlockFailure:(BlockFailure)failure {
    _blockSucess = sucess;
    _blockFailure = failure;

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager.requestSerializer setValue:@"calvinAndHobbessRock" forHTTPHeaderField:kSession];

    if ([self.method isEqualToString:METHOD_GET]) {
        [self requestMethodGetWithManager:manager];
    } else if ([self.method isEqualToString:METHOD_POST]) {
        [self requestPostWithManager:manager];
    } else if ([self.method isEqualToString:DOWNLOAD]) {
        [self downloadFile];
    }
}

- (void)requestMethodGetWithManager:(AFHTTPRequestOperationManager *)manager {
    
    [manager GET:[self finalUrl] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        _blockSucess(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        _blockFailure(error);
    }];
}

- (void)requestPostWithManager:(AFHTTPRequestOperationManager *)manager {
    
    NSDictionary *parameters = [self parameters];
    [manager POST:[self finalUrl] parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        _blockSucess(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        _blockFailure(error);
    }];
}

- (void)downloadFile {
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURL *URL = [NSURL URLWithString:@"http://fuckmu.esy.es/Default.plist"];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSessionDownloadTask *downloadTask = [manager downloadTaskWithRequest:request progress:nil destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
        NSURL *documentsDirectoryURL = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
        return [documentsDirectoryURL URLByAppendingPathComponent:[response suggestedFilename]];
    } completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
        _blockSucess(filePath);
        NSLog(@"File downloaded to: %@", filePath);
    }];
    [downloadTask resume];
}

- (NSString *)method {
    return nil;
}

- (NSString *)URL {
    return nil;
}

- (NSDictionary *)parameters {
    return nil;
}

#pragma mark - Private Method 

- (NSString *)finalUrl {
    return [NSString stringWithFormat:@"%@/%@", HOST_URL, [self URL]];
}
@end
