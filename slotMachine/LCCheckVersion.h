//
//  LCCheckVersion.h
//  slotMachine
//
//  Created by Lê Công on 12/24/14.
//  Copyright (c) 2014 Le Cong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LCSetting.h"

@interface LCCheckVersion : NSObject

@property (nonatomic, strong) LCSetting *setting;
@property (nonatomic, strong) NSString *version;
@property (nonatomic) BOOL isUpdate;

@end
