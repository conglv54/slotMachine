//
//  LCBigWinView.h
//  slotMachine
//
//  Created by Le Cong on 1/20/15.
//  Copyright (c) 2015 Le Cong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LCBigWinView : UIView

@property (nonatomic, strong) void (^touchCallBack) ();

- (id)initWithWineType:(int)winType andFrame:(CGRect) frame;

@end
