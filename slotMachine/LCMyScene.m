//
//  LCMyScene.m
//  slotMachine
//
//  Created by Le Cong on 12/14/14.
//  Copyright (c) 2014 Le Cong. All rights reserved.
//

#import "LCMyScene.h"
#import "LCVeticalCell.h"
#import "SKNode+Frame.h"
#import "LCDoSpin.h"
#import "LCSpin.h"

@implementation LCMyScene {
    NSMutableArray *arrVerticalCell;
    
    NSTimeInterval _lastUpdateTime;
    NSTimeInterval _deltaTime;
    NSTimeInterval _lastTouch;
    
    CGPoint locationBegin;
    int index;
    NSInteger coinWin;
    
    NSTimer *timer;
    
    LCDoSpin *spinTask;
}

- (id)initWithSize:(CGSize)size {
    
    self = [super initWithSize:size];
    
    if (self) {
        
        arrVerticalCell = [NSMutableArray new];
        _isAuto = FALSE;
        
        SKSpriteNode *bg = [SKSpriteNode spriteNodeWithImageNamed:@"bgMachine"];
        bg.anchorPoint = CGPointMake(0, 0);
        bg.position = [self newPoint:CGPointMake(102.5, 62)];
        bg.size = [self newSize:CGSizeMake(366, 204.5)];
        
        [self addChild:bg];
        
        spinTask = [[LCDoSpin alloc] init];
        
        for (int i = 0 ; i < 5; i ++) {
            LCVeticalCell *verticalCell = [[LCVeticalCell alloc] initWithIndex:i];
            verticalCell.gameScene = self;
            
            [arrVerticalCell addObject:verticalCell];
        }
    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    for (LCVeticalCell *cell in arrVerticalCell) {
        if (cell.currentState != State_Idle) {
            return;
        }
    }
    
    for (UITouch *touch in touches) {
        locationBegin  = [touch locationInNode:self];
        _lastTouch = [event timestamp];
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
    for (LCVeticalCell *cell in arrVerticalCell) {
        if (cell.currentState != State_Idle) {
            return;
        }
    }

    if (_isAuto) {
        return;
    }
    
    for (UITouch *touch in touches)
    {
        CGPoint location  = [touch locationInNode:self];
        SKNode *node = [self nodeAtPoint:location];
        
        if (node != self) {
            if ([node.name isEqualToString:@"Cell"] || [node.name isEqualToString:@"Result"] )
            {
                CGPoint previousLocation = [touch previousLocationInNode:self];
                float diff = location.y - previousLocation.y;
                
                index = [self cellInLocation:location];
                LCVeticalCell *verticalCell = arrVerticalCell[index];
                [verticalCell changeLocationWithDistance:diff];
            }
        }
    }
    
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    for (LCVeticalCell *cell in arrVerticalCell) {
        if (cell.currentState != State_Idle) {
            return;
        }
    }
    
    CGPoint locationEnd;
    LCVeticalCell *cell = arrVerticalCell[index];
    
    for (UITouch *touch in touches) {
        locationEnd  = [touch locationInNode:self];
    }
    
    SKNode *node = [self nodeAtPoint:locationEnd];
    if (node == self) {
        return;
    }
    
    if (_isAuto) {
        return;
    }
    
    NSTimeInterval touchBeginEndInterval = [event timestamp] - _lastTouch;
    CGFloat distance = locationEnd.y - locationBegin.y;
    
    CGFloat vRote = distance/touchBeginEndInterval/2;
    
    if (vRote < -900) {
        vRote = - 900;
    }
    
    if (vRote <  - 250) {
        _isRote = TRUE;
        cell.velocityDefault = - vRote;
        [cell stepState];
    }
}

- (void)update:(NSTimeInterval)currentTime {
    if(_lastUpdateTime)
    {
        _deltaTime = currentTime - _lastUpdateTime;
    }
    else
    {
        _deltaTime = 0;
    }
    _lastUpdateTime = currentTime;
    
    for (LCVeticalCell *verticalCell in arrVerticalCell) {
        [verticalCell update:_deltaTime];
    }
}

- (void)start {
    NSLog(@"Sent to server, bet: %ld", self.bet);
 
    spinTask.bet = self.bet;
    
    if ([_gameDelegate respondsToSelector:@selector(didStart:)]) {
        [_gameDelegate didStart:self.bet];
    }
    
    [spinTask requestWithBlockSucess:^(id sucess) {
        LCSpin *spin = (LCSpin *)sucess;
        NSArray *results = spin.arrResult;
        coinWin = spin.coin;
        
        for (int i = 0 ; i < arrVerticalCell.count; i ++) {
            LCVeticalCell *verticalCell = arrVerticalCell[i];
            verticalCell.isReciveResult = true;
            verticalCell.result = [results[i] intValue];
        }
    } andBlockFailure:^(id error) {
        
    }];
    
    LCVeticalCell *lastCell = arrVerticalCell[4];
    if (lastCell.currentState == State_Idle) {
        for (LCVeticalCell *verticalCell in arrVerticalCell) {
            [verticalCell stepState];
        }
    }
}

- (void)stop {
    if ([_gameDelegate respondsToSelector:@selector(didStop:)]) {
        [_gameDelegate didStop:coinWin];
    }
}

- (int)cellInLocation:(CGPoint)location {
    index = (location.x - 100.0)/75;
    return index;
}

@end
