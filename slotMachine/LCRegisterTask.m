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
@end
