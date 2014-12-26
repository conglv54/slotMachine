//
//  HARegister.h
//  slotMachine
//
//  Created by Le Cong on 12/25/14.
//  Copyright (c) 2014 Le Cong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LCUser.h"

@interface HARegister : NSObject

@property (nonatomic, strong) LCUser *user;
@property (nonatomic, strong) NSString *session_id;

@end
