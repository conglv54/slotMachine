//
//  Utils.h
//  SpriteDemo
//
//  Created by Lê Công on 12/10/14.
//  Copyright (c) 2014 Lê Công. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>

#define HEIGHT_SCRENE [UIScreen mainScreen].applicationFrame.size.height
#define WIDTH_SCRENE UIScreen mainScreen].applicationFrame.size.width

static const float OBJECT_VELOCITY = 500;
static const float MAX_VELOCITY = 1000;

static inline CGPoint CGPointAdd(const CGPoint a, const CGPoint b)
{
    return CGPointMake(a.x + b.x, a.y + b.y);
}

static inline CGPoint CGPointMultiplyScalar(const CGPoint a, const CGFloat b)
{
    return CGPointMake(a.x * b, a.y * b);
}

@interface Utils : NSObject


+ (NSString *)stringFromDouble:(CGFloat)currency;
+ (NSString *)stringFromDouble:(CGFloat)currency andNumberFormatterStyle:(NSNumberFormatterStyle) style;

+ (NSString *)getUniqueDeviceIdentifierAsString;
@end
