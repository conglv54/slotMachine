//
//  LCRegisterTask.h
//  slotMachine
//
//  Created by Le Cong on 12/18/14.
//  Copyright (c) 2014 Le Cong. All rights reserved.
//

#import "LCBaseTaskNetWork.h"

@interface LCRegisterTask : LCBaseTaskNetWork

@property (nonatomic, strong) NSString *deviceID;
@property (nonatomic) int os;
@property (nonatomic, strong) NSString *token;

- (id)initWithDeviceID:(NSString *)deviceID;

@end
