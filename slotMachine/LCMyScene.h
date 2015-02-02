//
//  LCMyScene.h
//  slotMachine
//

//  Copyright (c) 2014 Le Cong. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@protocol LCMygameDelegate <NSObject>

- (void)didStart:(NSInteger)coin;
- (void)didStop:(NSInteger)coin andBigWin:(BOOL)isBigWin winType:(int)wineType;

@end

@interface LCMyScene : SKScene

@property (nonatomic) BOOL isAuto;
@property (nonatomic) BOOL isRote;

@property (nonatomic) NSInteger bet;
@property (nonatomic) int timerCount;

@property (nonatomic, assign) id <LCMygameDelegate> gameDelegate;

- (void)start;
- (void)stop;

@end
