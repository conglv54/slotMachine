//
//  LCDownloadTask.m
//  slotMachine
//
//  Created by Le Cong on 12/19/14.
//  Copyright (c) 2014 Le Cong. All rights reserved.
//

#import "LCDownloadTask.h"
#import <AFNetworking.h>

@implementation LCDownloadTask

- (BOOL)isShowLoading {
    return NO;
}

- (NSString *)method {
    return DOWNLOAD;
}

@end
