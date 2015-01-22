//
//  LCShippingTask.h
//  slotMachine
//
//  Created by Le Cong on 1/22/15.
//  Copyright (c) 2015 Le Cong. All rights reserved.
//

#import "LCBaseTaskNetWork.h"

@interface LCShippingTask : LCBaseTaskNetWork

@property (nonatomic, strong) NSString *firstName;
@property (nonatomic, strong) NSString *address;
@property (nonatomic, strong) NSString *state;
@property (nonatomic, strong) NSString *phone;
@property (nonatomic, strong) NSString *lastName;
@property (nonatomic, strong) NSString *city;
@property (nonatomic, strong) NSString *country;
@property (nonatomic, strong) NSString *email;

@end
