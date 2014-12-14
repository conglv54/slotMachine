//
//  SKNode+Frame.m
//  Jackpot
//
//  Created by Lê Công on 12/4/14.
//  Copyright (c) 2014 Lê Công. All rights reserved.
//

#import "SKNode+Frame.h"

@implementation SKNode (Frame)


- (CGRect)getScreenFrameForCurrentOrientation {
    return [self getScreenFrameForOrientation:[UIApplication sharedApplication].statusBarOrientation];
}

- (CGRect)getScreenFrameForOrientation:(UIInterfaceOrientation)orientation {
    
    UIScreen *screen = [UIScreen mainScreen];
    CGRect fullScreenRect = screen.bounds;
    
//    if(orientation == UIInterfaceOrientationLandscapeRight || orientation == UIInterfaceOrientationLandscapeLeft){
//        CGRect temp = CGRectZero;
//        temp.size.width = fullScreenRect.size.height;
//        temp.size.height = fullScreenRect.size.width;
//        fullScreenRect = temp;
//    }
    
    return fullScreenRect;
}

- (CGPoint)newPoint:(CGPoint)currentPoint {
    
//    CGRect screenFrame = [self getScreenFrameForCurrentOrientation];
//    
//    CGFloat widthScreen = screenFrame.size.width;
//    CGFloat heightScreen = screenFrame.size.height;
//    
//    CGFloat xScale = widthScreen/568;
//    CGFloat yScale = heightScreen/320;
//    
//    
//    CGPoint newPoint;
//    newPoint = CGPointMake(currentPoint.x * xScale, currentPoint.y *yScale);
//    return newPoint;
    return currentPoint;
}

- (CGSize)newSize:(CGSize)currentSize {
    
//    CGRect screenFrame = [self getScreenFrameForCurrentOrientation];
//    
//    CGFloat widthScreen = screenFrame.size.width;
//    CGFloat heightScreen = screenFrame.size.height;
//    
//    CGFloat xScale = widthScreen/568;
//    CGFloat yScale = heightScreen/320;
//    
//    
//    CGSize newSize;
//    newSize = CGSizeMake(currentSize.width * xScale, currentSize.height * yScale);
//    return newSize;
    
    return currentSize;
}

@end
