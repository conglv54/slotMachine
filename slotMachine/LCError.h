//
//  LCError.h
//  slotMachine
//
//  Created by Le Cong on 12/21/14.
//  Copyright (c) 2014 Le Cong. All rights reserved.
//

#import <Foundation/Foundation.h>

#define LC_ERROR_KEY(code)                    [NSString stringWithFormat:@"%ld", code]
#define LC_ERROR_LOCALIZED_DESCRIPTION(code)  NSLocalizedStringFromTable(LC_ERROR_KEY(code), @"LCError", nil)

FOUNDATION_EXPORT NSString *const LCMyAppErrorDomain;

enum {
    FSUserNotLoggedInError = 1000,
    FSUserLogoutFailedError,
    FSProfileParsingFailedError,
    FSProfileBadLoginError,
    FSFNIDParsingFailedError,
};

@interface LCError : NSObject

+ (id)errorWithCode:(NSInteger)code;

@end
