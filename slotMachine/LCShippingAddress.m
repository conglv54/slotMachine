//
//  LCShippingAddress.m
//  slotMachine
//
//  Created by Le Cong on 1/13/15.
//  Copyright (c) 2015 Le Cong. All rights reserved.
//

#import "LCShippingAddress.h"

@implementation LCShippingAddress

- (UIView *)viewForContentView {
    UILabel *title = [self labelWithText:@"SHIPPING ADDRESS" font:[UIFont fontWithName:@"Oswald" size:18] frame:CGRectMake(150, 28, 0, 0) andColor:[UIColor whiteColor]];
    
    ////////////////////////////////////
    
    UILabel *lblFirstName = [self labelWithText:@"First Name" andFrame:CGRectMake(25, 75, 0, 0)];
    UITextField *txtFirstname = [self textfieldWithFrame:CGRectMake(110, 75, 0, 0)];
    
    UILabel *address = [self labelWithText:@"Address"andFrame:CGRectMake(25, 97, 0, 0)];
    UITextField *txtAddress = [self textfieldWithFrame:CGRectMake(110, 100, 0, 0)];

    UILabel *lblState = [self labelWithText:@"State"andFrame:CGRectMake(25, 122, 0, 0)];
    UITextField *txtState = [self textfieldWithFrame:CGRectMake(110, 125, 0, 0)];
    
    UILabel *lblPhone = [self labelWithText:@"Phone"andFrame:CGRectMake(25, 145, 0, 0)];
    UITextField *txtPhone = [self textfieldWithFrame:CGRectMake(110, 148, 0, 0)];

    ////////////////////////////////////
    
    UILabel *lblLastName = [self labelWithText:@"Last Name" andFrame:CGRectMake(242, 75, 0, 0)];
    UITextField *txtLastName = [self textfieldWithFrame:CGRectMake(320, 75, 0, 0)];
    
    UILabel *lblCity = [self labelWithText:@"City"andFrame:CGRectMake(242, 97, 0, 0)];
    UITextField *txtCity = [self textfieldWithFrame:CGRectMake(320, 100, 0, 0)];
    
    UILabel *lblCountry = [self labelWithText:@"Country"andFrame:CGRectMake(242, 122, 0, 0)];
    UITextField *txtCountry = [self textfieldWithFrame:CGRectMake(320, 125, 0, 0)];
    
    UILabel *lblEmail = [self labelWithText:@"Email"andFrame:CGRectMake(242, 145, 0, 0)];
    UITextField *txtEmail = [self textfieldWithFrame:CGRectMake(320, 148, 0, 0)];
    
    ///////////////////////////////////
    
    
    //////////////////////////////////
    
    UIImage *imgSubmit = [UIImage imageNamed:@"btnSubmit"];
    UIButton *btnSubmit = [UIButton buttonWithType:UIButtonTypeCustom];
    btnSubmit.frame = CGRectMake(200, 183, imgSubmit.size.width, imgSubmit.size.height);
    [btnSubmit setImage:imgSubmit forState:UIControlStateNormal];
    [self.contentView addSubview:btnSubmit];
    
    [self.contentView addSubview:title];
    
    [self.contentView addSubview:lblFirstName];
    [self.contentView addSubview:txtFirstname];
    
    [self.contentView addSubview:address];
    [self.contentView addSubview:txtAddress];
    
    [self.contentView addSubview:lblState];
    [self.contentView addSubview:txtState];
    
    [self.contentView addSubview:lblPhone];
    [self.contentView addSubview:txtPhone];
    
    [self.contentView addSubview:lblLastName];
    [self.contentView addSubview:txtLastName];
    
    [self.contentView addSubview:lblCity];
    [self.contentView addSubview:txtCity];
    
    [self.contentView addSubview:lblCountry];
    [self.contentView addSubview:txtCountry];
    
    [self.contentView addSubview:lblEmail];
    [self.contentView addSubview:txtEmail];
    
    return self.contentView;
}

- (UITextField *)textfieldWithFrame:(CGRect) frame {
    UIImage *img = [UIImage imageNamed:@"bgTxt"];
    UITextField *txt = [[UITextField alloc] initWithFrame:CGRectMake(frame.origin.x, frame.origin.y, img.size.width, img.size.height)];
    txt.delegate = self;
    txt.backgroundColor = [UIColor colorWithPatternImage:img];
    return txt;
}

- (UILabel *)labelWithText:(NSString *)text andFrame:(CGRect)rect{
    return [self labelWithText:text font:[UIFont fontWithName:@"AvantGarde" size:14] frame:rect];
}

- (UILabel *)labelWithText:(NSString *)text font:(UIFont *)font frame:(CGRect)rect{
    return [self labelWithText:text font:font frame:rect andColor:rgb(207, 79, 0)];
}

- (UILabel *)labelWithText:(NSString *)text font:(UIFont *)font frame:(CGRect)rect andColor:(UIColor *)color{
    UILabel *label = [[UILabel alloc] initWithFrame:rect];
    label.text = text;
    [label sizeToFit];
    label.font = font;
    label.textColor = color;
    return label;
}

@end
