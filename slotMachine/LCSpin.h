//
//  LCSpin.h
//  slotMachine
//
//  Created by Le Cong on 12/22/14.
//  Copyright (c) 2014 Le Cong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LCSpin : NSObject

@property (nonatomic) NSInteger coin;
@property (nonatomic, strong) NSArray *arrResult;

@property (nonatomic) BOOL isBigWin;

@property (nonatomic) int winType;

@end
