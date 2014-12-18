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

@end
