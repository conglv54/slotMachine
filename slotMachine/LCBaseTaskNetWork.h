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

extern NSString *const HOST_URL;

extern NSString *const kSession;

typedef void (^BlockSucess)(id sucess);
typedef void (^BlockFailure)(id error);

@interface LCBaseTaskNetWork : NSObject

@property (nonatomic, strong) BlockSucess blockSucess;
@property (nonatomic, strong) BlockFailure blockFailure;

@property (nonatomic, strong) NSString *method;
@property (nonatomic, strong) NSString *URL;
@property (nonatomic, strong) NSDictionary *parameters;

- (void)requestWithBlockSucess:(BlockSucess) sucess andBlockFailure:(BlockFailure) failure;

@end
