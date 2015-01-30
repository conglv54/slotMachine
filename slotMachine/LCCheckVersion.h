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

@property (nonatomic, strong) NSDictionary *setting;
@property (nonatomic, strong) NSString *version;
@property (nonatomic, strong) NSArray *items;
@property (nonatomic, strong) NSArray *itemsBigwin;
@property (nonatomic) BOOL isUpdate;
@property (nonatomic, strong) NSString *pathFile;
@property (nonatomic) CGFloat time;
@end
