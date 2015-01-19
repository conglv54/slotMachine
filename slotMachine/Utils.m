//
//  Utils.m
//  SpriteDemo
//
//  Created by Lê Công on 12/10/14.
//  Copyright (c) 2014 Lê Công. All rights reserved.
//

#import "Utils.h"
#import <SSKeychain.h>

@implementation Utils

+ (NSDate *)dateFromString:(NSString *)dateString {
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"HH:mm:ss"];
    NSDate *date = [dateFormat dateFromString:dateString];
    return date;
}

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

+ (NSString *)getUniqueDeviceIdentifierAsString {
    
    NSString *appName=[[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString*)kCFBundleNameKey];
    
    NSString *strApplicationUUID = [SSKeychain passwordForService:appName account:@"congdola"];
    if (strApplicationUUID == nil)
    {
        strApplicationUUID  = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
        [SSKeychain setPassword:strApplicationUUID forService:appName account:@"congdola"];
    }
    
    return strApplicationUUID;
}

@end
