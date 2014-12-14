//
//  SKNode+Frame.h
//  Jackpot
//
//  Created by Lê Công on 12/4/14.
//  Copyright (c) 2014 Lê Công. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface SKNode (Frame)

- (CGPoint)newPoint:(CGPoint)currentPoint;
- (CGSize)newSize:(CGSize)currentSize;

@end
