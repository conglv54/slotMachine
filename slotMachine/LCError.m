//
//  LCError.m
//  slotMachine
//
//  Created by Le Cong on 12/21/14.
//  Copyright (c) 2014 Le Cong. All rights reserved.
//

#import "LCError.h"

NSString *const LCMyAppErrorDomain = @"com.conglv.slotMachine";

@implementation LCError

+ (id)errorWithCode:(NSInteger)code{
    
    NSString *message = LC_ERROR_LOCALIZED_DESCRIPTION(code);
    NSDictionary *detail = @{NSLocalizedDescriptionKey: message};
    
    NSError *error = [NSError errorWithDomain:LCMyAppErrorDomain code:code userInfo:detail];
    return error;
}
@end
