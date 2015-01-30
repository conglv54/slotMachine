//
//  LCBigWinView.m
//  slotMachine
//
//  Created by Le Cong on 1/20/15.
//  Copyright (c) 2015 Le Cong. All rights reserved.
//

#import "LCBigWinView.h"
#import "LCItemBigwin.h"
#import "LCFileManager.h"

@implementation LCBigWinView {
    NSArray *items;
}

- (id)initWithWineType:(int)winType andFrame:(CGRect) frame{
    self = [super initWithFrame:frame];
    if (self) {
        UIView *backgroundView = [[UIView alloc] initWithFrame:frame];
        backgroundView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
        
        NSString *imageName = [self imageNameWittItemID:winType];
        NSString *imagPath = [[LCFileManager shareInstance] documentDirectory];
        UIImage *image = [UIImage imageWithContentsOfFile:[imagPath stringByAppendingPathComponent:imageName]];
        
        UIImageView *forgroundView = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMidX(frame) - 366/2, CGRectGetMidY(frame) - 208/2, 366, 208)];
        forgroundView.image = image;
        forgroundView.userInteractionEnabled = YES;
        
        UIGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
        [forgroundView addGestureRecognizer:tapGesture];
        
        [self addSubview:backgroundView];
        [self addSubview:forgroundView];        
    }
    return self;
}

- (NSString *)imageNameWittItemID:(int)item_id {
    items = [[LCFileManager shareInstance]getItemsBigwin];
    
    for (LCItemBigwin *item in items) {
        if (item.item_id == item_id) {
            return item.name;
        }
    }
    
    NSLog(@"No image with id: %d", item_id);
    return @"NO_DATA.jpg";
}

- (void)tap {
    _touchCallBack();
    [self removeFromSuperview];
}

@end
