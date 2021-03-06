//
//  LCBaseTaskNetWork.m
//  slotMachine
//
//  Created by Le Cong on 12/18/14.
//  Copyright (c) 2014 Le Cong. All rights reserved.
//

#import "LCBaseTaskNetWork.h"
#import "LCFileManager.h"
#import <SVProgressHUD.h>
#import <AFNetworking.h>

NSString *const METHOD_GET = @"GET";
NSString *const METHOD_PUSH = @"PUSH";

NSString *const METHOD_POST = @"POST";
NSString *const METHOD_DELETE = @"DELETE";

NSString *const DOWNLOAD = @"DOWNLOAD";

NSString *const HOST_URL_API = @"http://localhost:8000/api/jackpot";
NSString *const HOST_URL = @"http://localhost:8000";

NSString *const kSession = @"app-session-id";

int const kSucess = 0;

@implementation LCBaseTaskNetWork

- (id)init {
    self = [super init];
    if (self) {
        self.isSession = true;
        self.isDeBug = false;
        self.isShowLoading = true;
        
        [SVProgressHUD setBackgroundColor:[UIColor blackColor]];
        [SVProgressHUD setForegroundColor:[UIColor whiteColor]];
    }
    return self;
}

#pragma mark - Public Method 

- (void)requestWithBlockSucess:(BlockSucess)sucess andBlockFailure:(BlockFailure)failure {
    
    if (self.isShowLoading) {
        [SVProgressHUD showWithStatus:@"Loading..." maskType:SVProgressHUDMaskTypeBlack];
    }
    
    _blockSucess = sucess;
    _blockFailure = failure;
    
    if (self.isDeBug) {
        int64_t delayInSeconds = 2;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            [self setCallBackWithResponse:[self genResponse]];
        });
        return;
    }

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    if (self.isSession) {
        [manager.requestSerializer setValue:[[LCFileManager shareInstance]getSessionID] forHTTPHeaderField:kSession];
    }

    if ([self.method isEqualToString:METHOD_GET]) {
        [self requestMethodGetWithManager:manager];
    } else if ([self.method isEqualToString:METHOD_POST]) {
        [self requestPostWithManager:manager];
    } else if ([self.method isEqualToString:DOWNLOAD]) {
        [self downloadFile];
    }
}

#pragma mark - Sent Request With Method

- (void)requestMethodGetWithManager:(AFHTTPRequestOperationManager *)manager {
    
    [manager GET:[self finalUrl] parameters:self.parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {

        NSLog(@"JSON: %@", responseObject);
        
        [self setCallBackWithResponse:responseObject];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [self setCallbackWithError:error];
    }];
}

- (void)requestPostWithManager:(AFHTTPRequestOperationManager *)manager {
    
    NSDictionary *parameters = [self parameters];
    
    [manager POST:[self finalUrl] parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"JSON Response %@: %@", NSStringFromClass(self.class), responseObject);
        
        [self setCallBackWithResponse:responseObject];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [self setCallbackWithError:error];
    }];
}

- (void)downloadFile {
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURL *URL = [NSURL URLWithString:[self URL]];
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

- (void)setCallBackWithResponse:(id)response {
    if (self.isShowLoading) {
        [SVProgressHUD dismiss];
    }
    
    int code = [self parseCodeFromResponse:response];
    
    if (code == kSucess) {
        
        NSDictionary *data = response[@"data"];
            
        id resPonsedata = [self parseDataWithResponse:data];
        _blockSucess(resPonsedata);
            
    } else {

        NSError *error = [LCError errorWithCode:code];
        NSLog(@"%@: %@", NSStringFromClass(self.class), error.localizedDescription);
        _blockFailure(error);
    }

}

- (void)setCallbackWithError:(NSError *)error {
    if (self.isShowLoading) {
        [SVProgressHUD dismiss];
    }
    
    NSLog(@"Error: %@", error);
    _blockFailure(error);
}

#pragma mark - Method Overide Subclass

- (id)parseDataWithResponse:(id)response {
    return nil;
}

- (id)genResponse {
    return nil;
}

#pragma mark - Help Method

- (int)parseCodeFromResponse:(NSDictionary *)response {
    int code = 0;
    
    if (response[@"code"]) {
        code = [response[@"code"] intValue];
    } else {
        NSLog(@"%@: Error code = nil", NSStringFromClass(self.class));
    }
    
    return code;
}

- (NSString *)finalUrl {
    return [NSString stringWithFormat:@"%@/%@", HOST_URL_API, [self URL]];
}

@end
