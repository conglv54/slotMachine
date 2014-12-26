//
//  LCBaseTaskNetWork.h
//  slotMachine
//
//  Created by Le Cong on 12/18/14.
//  Copyright (c) 2014 Le Cong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LCNetworkConfig.h"

extern NSString *const METHOD_GET;
extern NSString *const METHOD_PUSH;

extern NSString *const METHOD_POST;
extern NSString *const METHOD_DELETE;

extern NSString *const DOWNLOAD;

typedef void (^BlockSucess)(id sucess);
typedef void (^BlockFailure)(id error);

@interface LCBaseTaskNetWork : NSObject

@property (nonatomic, strong) BlockSucess blockSucess;
@property (nonatomic, strong) BlockFailure blockFailure;

@property (nonatomic, strong) NSString *method;
@property (nonatomic, strong) NSString *URL;
@property (nonatomic, strong) NSDictionary *parameters;
@property (nonatomic)         BOOL isSession;
@property (nonatomic, strong) id dataParse;

- (void)requestWithBlockSucess:(BlockSucess) sucess andBlockFailure:(BlockFailure) failure;

#pragma mark - Method Overide Subclass

- (id)parseDataWithResponse:(id)response;

#pragma mark - Debug

@property (nonatomic) BOOL isDeBug;
@property (nonatomic) BOOL isShowLoading;

- (id)genResponse;

@end
