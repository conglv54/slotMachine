//
//  LCVeticalCell.m
//  SpriteDemo
//
//  Created by Le Cong on 12/10/14.
//  Copyright (c) 2014 Lê Công. All rights reserved.
//

#import "LCVeticalCell.h"
#import "LCFileManager.h"
#import "LCItem.h"

@implementation LCVeticalCell {
    NSMutableArray *_arrCell;
    
    CGPoint velocityY;
    
    BOOL isGenResult;
    
    CGFloat extraTime;
    
    int currentIndex;
    
    NSArray *items;
}

- (id)initWithIndex:(int)index {
    self = [super init];
    if (self) {
        _arrCell = [NSMutableArray new];
        currentIndex = index;
        _isReciveResult = false;
        _velocityDefault = 500;
        
        items = [[LCFileManager shareInstance]getItems];
        
        for (int i = 0; i < 6; i ++) {
            CGPoint position = CGPointMake(102.5+75*index, 62 + (67*i));
            SKSpriteNode *node = [self generateObjectWithPosition:position andImageName:[self imageNameRandom]];
            [_arrCell addObject:node];
        }
    }
    return self;
}

- (NSString *)imageNameRandom {
    NSUInteger randomIndex = arc4random() % items.count;
    LCItem *item = items[randomIndex];
    return item.name;
}

- (NSString *)imageNameWittItemID:(int)item_id {
    for (LCItem *item in items) {
        if (item.item_id == item_id) {
            return item.name;
        }
    }
    
    NSLog(@"No image with id: %d", item_id);
    return @"noImage";
}

- (SKSpriteNode *)generateObjectWithPosition:(CGPoint) position andImageName:(NSString *)imageName{
    NSString *imagPath = [[LCFileManager shareInstance] documentDirectory];
    UIImage *image = [UIImage imageWithContentsOfFile:[imagPath stringByAppendingPathComponent:imageName]];
    
    if (image == nil)
        image =[UIImage imageNamed:@"NO_DATA.jpg"];
    
    SKTexture *texture = [SKTexture textureWithImage:image];
    SKSpriteNode *note = [[SKSpriteNode alloc] initWithTexture:texture];
    
    note.position = position;
    note.anchorPoint = CGPointMake(0, 0);
    note.name = @"Cell";
    note.size = CGSizeMake(72, 67);
    
    return note;
}

- (void)setGameScene:(LCMyScene *)gameScene {
    _gameScene = gameScene;
    
    for (SKSpriteNode *node in _arrCell) {
        [_gameScene addChild:node];
    }
}

- (void)changeLocationWithDistance:(CGFloat)distance {
    for (SKSpriteNode *node in _arrCell) {
        CGPoint newPosition = CGPointMake(node.position.x, node.position.y + distance);
        node.position = newPosition;
    } 
}

- (void)stepState {
    switch (_currentState) {
        case State_Idle:
            _currentState = State_Start;
            break;
        case State_Start:
            _currentState = State_Stop;
            break;
        case  State_Stop:
            _currentState = State_Idle;
            break;
        default:
            break;
    }
}

- (void)update:(NSTimeInterval)deltaTime {
    
    SKSpriteNode *minNode;
    SKSpriteNode *maxNode;
    
    switch (_currentState) {
        case State_Idle:
            break;
        case  State_Start:
            velocityY.y = velocityY.y - _velocityDefault*deltaTime;
            
            if (velocityY.y < - MAX_VELOCITY) {
                velocityY.y = - MAX_VELOCITY;
                if (_isReciveResult) {
                    extraTime = extraTime + deltaTime;
                    if (extraTime > currentIndex*0.25) {
                        [self stepState];
                    }                    
                }
            }
            
            break;
            
        case State_Stop:
            velocityY.y = velocityY.y + OBJECT_VELOCITY*deltaTime;
            if (velocityY.y > 0) {
                [self reset];
            }
            
            break;
        default:
            break;
    }
    
    CGPoint amtToMove = CGPointMultiplyScalar(velocityY, deltaTime);
    
    for (SKSpriteNode *node in _arrCell) {
        node.position = CGPointAdd(node.position, amtToMove);
    }
    
    if (isGenResult) {
        for (SKSpriteNode *node in _arrCell) {
            if ([node.name isEqualToString:@"Result"]) {
                if (node.position.y <= 133) {
                    CGFloat distance = 133 - node.position.y;
                    [node setPosition:CGPointMake(node.position.x, 133)];
                    
                    for (SKSpriteNode *node in _arrCell) {
                        if ([node.name isEqualToString:@"Cell"]) {
                            [node setPosition:CGPointMake(node.position.x, node.position.y + distance)];
                        }
                    }
                    
                    [self reset];
                    return;
                }
                
            }
        }
    }
    
    minNode = [_arrCell objectAtIndex:0];
    maxNode = [_arrCell objectAtIndex:5];
    
    if (minNode.position.y < 0) {
        
        NSString *imageName  = [self imageNameRandom];
        NSString *name = @"Cell";
        
        if (velocityY.y > - 600 && _currentState == State_Stop && isGenResult == FALSE) {
            isGenResult = TRUE;
            imageName = [self imageNameWittItemID:_result];
            name = @"Result";
        }
        
        SKSpriteNode *node = [self generateObjectWithPosition:CGPointMake(maxNode.position.x, maxNode.position.y + maxNode.size.height) andImageName:imageName];
        node.name = name;
        [_arrCell addObject:node];
        [self.gameScene addChild:node];

        [minNode removeFromParent];
        [_arrCell removeObject:minNode];
    }
    
    if (maxNode.position.y > 387) {
        NSString *imageName = [self imageNameRandom];
        NSString *name = @"Cell";

        SKSpriteNode *node = [self generateObjectWithPosition:CGPointMake(minNode.position.x, minNode.position.y - minNode.size.height) andImageName:imageName];
        node.name = name;
        [_arrCell insertObject:node atIndex:0];
        [self.gameScene addChild:node];
        
        [maxNode removeFromParent];
        [_arrCell removeObject:maxNode];
        
    }
}

- (NSString *)imageNameWithSlot:(int)slot {
    NSString *imageName = [NSString stringWithFormat:@"jackPot%d", slot];
    return imageName;
}

- (void)reset {
    velocityY.y = 0;
    _velocityDefault = 500;
    _isReciveResult = FALSE;
    extraTime = 0;
    isGenResult = FALSE;
    
    _gameScene.timerCount = 0;
    _gameScene.isRote = FALSE;
    
    [self stepState];
    
    if (currentIndex == 4) {
        [_gameScene stop];
        if (!_isBigWin) {
            if (_gameScene.isAuto) {
                [_gameScene start];
            }
        } else {
            _gameScene.isAuto = false;
        }
    }
}
@end
