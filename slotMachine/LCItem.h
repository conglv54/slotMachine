//
//  LCItem.h
//  slotMachine
//
//  Created by Lê Công on 1/8/15.
//  Copyright (c) 2015 Le Cong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LCItem : NSObject <NSCoding>

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *pathUrl;
@property (nonatomic) int item_id;

@end
