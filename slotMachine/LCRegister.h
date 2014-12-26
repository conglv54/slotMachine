//
//  LCRegister.h
//  slotMachine
//
//  Created by Lê Công on 12/26/14.
//  Copyright (c) 2014 Le Cong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LCUser.h"

@interface LCRegister : NSObject

@property (nonatomic, strong) LCUser *lcUser;
@property (nonatomic, strong) NSString *sessionID;

@end
