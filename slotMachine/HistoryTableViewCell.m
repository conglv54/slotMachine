//
//  HistoryTableViewCell.m
//  SpriteDemo
//
//  Created by Le Cong on 12/13/14.
//  Copyright (c) 2014 Lê Công. All rights reserved.
//

#import "HistoryTableViewCell.h"

@implementation HistoryTableViewCell {
    UILabel *lblTime;
    UILabel *lblDate;
    UILabel *lblBet;
    UILabel *lblWin;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initCompoment];
    }
    return self;
}

- (void)initCompoment {
    
    self.backgroundColor = [UIColor clearColor];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    lblDate = [[UILabel alloc] initWithFrame:CGRectMake(5, 8, 0, 0)];
    lblDate.text = @"13/12/2014";
    lblDate.textColor = [UIColor colorWithRed:207/255.0 green:79/255.0 blue:0 alpha:1.0];
    [lblDate sizeToFit];
    lblDate.font = [UIFont systemFontOfSize:13];
    
    lblTime = [[UILabel alloc] initWithFrame:CGRectMake(125, 8, 0, 0)];
    lblTime.text = @"12:11:00";
    lblTime.textColor = [UIColor colorWithRed:207/255.0 green:190/255.0 blue:0 alpha:1.0];
    [lblTime sizeToFit];
    lblTime.font = [UIFont systemFontOfSize:13];

    lblBet = [[UILabel alloc] initWithFrame:CGRectMake(255, 8, 0, 0)];
    lblBet.text = @"10";
    lblBet.textColor = [UIColor colorWithRed:76/255.0 green:125/255.0 blue:0 alpha:1.0];
    [lblBet sizeToFit];
    lblBet.font = [UIFont systemFontOfSize:13];
    
    lblWin = [[UILabel alloc] initWithFrame:CGRectMake(370, 8, 0, 0)];
    lblWin.text = @"0";
    lblWin.textColor = [UIColor colorWithRed:15/255.0 green:104/255.0 blue:94 alpha:1.0];
    [lblWin sizeToFit];
    lblWin.font = [UIFont systemFontOfSize:13];
    
    UIView *sperate = [[UIView alloc] initWithFrame:CGRectMake(5, 39, 400, 1)];
    sperate.backgroundColor = [UIColor colorWithRed:86/255.0 green:16/255.0 blue:0 alpha:0.8];
    
    [self addSubview:lblDate];
    [self addSubview:lblTime];
    [self addSubview:lblBet];
    [self addSubview:lblWin];
    [self addSubview:sperate];
}
@end
