//
//  UIView+Frame.m
//  Jackpot
//
//  Created by Lê Công on 12/4/14.
//  Copyright (c) 2014 Lê Công. All rights reserved.
//

#import "UIView+Frame.h"


@implementation UIView (Frame)

- (void)setNewFrame:(CGRect)frame {
//    
//    CGRect screenFrame = [self getScreenFrameForCurrentOrientation];
//    
//    CGFloat widthScreen = screenFrame.size.width;
//    CGFloat heightScreen = screenFrame.size.height;
//    
//    CGFloat xScale = widthScreen/568;
//    CGFloat yScale = heightScreen/320;
//    
//    CGFloat newX = frame.origin.x * xScale;
//    CGFloat newY = frame.origin.y * yScale;
//    
//    CGFloat newWidth = frame.size.width * xScale;
//    CGFloat newHeight = frame.size.height *yScale;
//    
//    CGRect newFrame = CGRectMake(newX, newY, newWidth, newHeight);
//    self.frame = newFrame;
    self.frame = frame;
}

#pragma mark - Private Method

- (CGRect)getScreenFrameForCurrentOrientation {
    return [self getScreenFrameForOrientation:[UIApplication sharedApplication].statusBarOrientation];
}

- (CGRect)getScreenFrameForOrientation:(UIInterfaceOrientation)orientation {
    
    UIScreen *screen = [UIScreen mainScreen];
    CGRect fullScreenRect = screen.bounds;
    
    //implicitly in Portrait orientation.
//    if(orientation == UIInterfaceOrientationLandscapeRight || orientation == UIInterfaceOrientationLandscapeLeft){
//        CGRect temp = CGRectZero;
//        temp.size.width = fullScreenRect.size.height;
//        temp.size.height = fullScreenRect.size.width;
//        fullScreenRect = temp;
//    }
    
    return fullScreenRect;
}

@end
