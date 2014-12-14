//
//  Utils.m
//  SpriteDemo
//
//  Created by Lê Công on 12/10/14.
//  Copyright (c) 2014 Lê Công. All rights reserved.
//

#import "Utils.h"

@implementation Utils

+ (NSString *)stringFromDouble:(CGFloat)currency{
    
    NSString *numberAsString = [self stringFromDouble:currency andNumberFormatterStyle:NSNumberFormatterDecimalStyle];
    return numberAsString;
}

+ (NSString *)stringFromDouble:(CGFloat)currency andNumberFormatterStyle:(NSNumberFormatterStyle) style {
    
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setNumberStyle: style];
    
    NSString *numberAsString = [numberFormatter stringFromNumber:[NSNumber numberWithInt:currency]];
    return numberAsString;
}
@end
