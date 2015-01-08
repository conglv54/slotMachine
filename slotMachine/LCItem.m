//
//  LCItem.m
//  slotMachine
//
//  Created by Lê Công on 1/8/15.
//  Copyright (c) 2015 Le Cong. All rights reserved.
//

#import "LCItem.h"

@implementation LCItem

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:_name forKey:kItemName];
    [aCoder encodeInt:_item_id forKey:kItemID];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        _name = [aDecoder decodeObjectForKey:kItemName];
        _item_id = [aDecoder decodeIntForKey:kItemID];
    }
    return self;
}

@end
