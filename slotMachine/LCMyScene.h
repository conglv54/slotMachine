//
//  LCMyScene.h
//  slotMachine
//

//  Copyright (c) 2014 Le Cong. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface LCMyScene : SKScene

@property (nonatomic) BOOL isAuto;
@property (nonatomic) BOOL isRote;

@property (nonatomic) NSInteger bet;

@property (nonatomic) int timerCount;

- (void)start;

@end
