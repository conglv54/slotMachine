//
//  LCGetHistoryTask.m
//  slotMachine
//
//  Created by Le Cong on 12/18/14.
//  Copyright (c) 2014 Le Cong. All rights reserved.
//

#import "LCGetHistoryTask.h"

@implementation LCGetHistoryTask

- (NSString *)method {
    return METHOD_GET;
}

- (NSString *)URL {
    return kGetHistory;
}

@end
