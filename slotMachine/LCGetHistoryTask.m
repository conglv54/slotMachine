//
//  LCGetHistoryTask.m
//  slotMachine
//
//  Created by Le Cong on 12/18/14.
//  Copyright (c) 2014 Le Cong. All rights reserved.
//

#import "LCGetHistoryTask.h"
#import "LCHistory.h"

@implementation LCGetHistoryTask

- (id)init {
    self = [super init];
    if (self) {
        _nextUrl = @"";
    }
    return self;
}

- (NSString *)method {
    return METHOD_GET;
}

- (NSString *)URL {
    return kGetHistory;
}

- (NSString *)finalUrl {
    if ([_nextUrl isEqualToString:@""]) {
        return [NSString stringWithFormat:@"%@/%@", HOST_URL, [self URL]];
    } else
        return _nextUrl;
}

- (NSDictionary *)parameters {
    return @{@"kind": [NSNumber numberWithInt:3]};
}

- (id)parseDataWithResponse:(id)response {
    NSMutableDictionary *dictResponse = [NSMutableDictionary new];
    NSMutableArray *histories = [NSMutableArray new];
    NSString *nextUrl = @"";
    
    
    for (NSDictionary *dictHistory in response[@"histories"]) {
        LCHistory *history = [[LCHistory alloc] init];
        history.date = [self dateFromString:dictHistory[@"created_at"]];
        history.time = [self timeFromString:dictHistory[@"created_at"]];
        history.bet = [dictHistory[@"coins_play"] intValue];
        history.win = [dictHistory[@"coins_win"] intValue];
        [histories addObject:history];
    }
    
    nextUrl = response[@"next"];
    if ([nextUrl isEqual:[NSNull null]])
        nextUrl = @"";
    
    [dictResponse setObject:nextUrl forKey:@"next"];
    [dictResponse setObject:histories forKey:@"histories"];
    
    return dictResponse;
}

- (NSString *)dateFromString:(NSString *)time {
    NSDate *date = [self nsdateFromString:time];
    
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit fromDate:date];
    
    NSInteger year = [components year];
    NSString *yearString = [NSString stringWithFormat:@"%ld", year];
    
    NSInteger month = [components month];
    NSString *monthString = month < 10 ? [NSString stringWithFormat:@"0%ld", month] : [NSString stringWithFormat:@"%ld", month];
    
    NSInteger day = [components day];
    NSString *dayString = day < 10 ? [NSString stringWithFormat:@"0%ld", day] : [NSString stringWithFormat:@"%ld", day];
    
    return [NSString stringWithFormat:@"%@-%@-%@", yearString, monthString, dayString];
}

- (NSString *)timeFromString:(NSString *)time {
    NSDate *date = [self nsdateFromString:time];
    
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit fromDate:date];
    
    NSInteger hour = [components hour];
    NSString *hourString = hour < 10 ? [NSString stringWithFormat:@"0%ld", hour] : [NSString stringWithFormat:@"%ld", hour];
    
    NSInteger minute = [components minute];
    NSString *minuteString = minute < 10 ? [NSString stringWithFormat:@"0%ld", minute] : [NSString stringWithFormat:@"%ld", minute];
    
    NSInteger second = [components second];
    NSString *secondString = second < 10 ? [NSString stringWithFormat:@"0%ld", second] : [NSString stringWithFormat:@"%ld", second];
    
    return [NSString stringWithFormat:@"%@:%@:%@", hourString, minuteString, secondString];
}

- (NSDate *)nsdateFromString:(NSString *)string {
    NSDateFormatter *dataFormat = [[NSDateFormatter alloc] init];
    [dataFormat setDateFormat:@"yyyy'-'MM'-'dd HH':'mm':'ss"];
    NSDate *date = [dataFormat dateFromString:string];
    return date;
}

#pragma mark - Debug

- (BOOL)isDeBug {
    return NO;
}

- (id)genResponse {
    NSMutableArray *arr = [NSMutableArray new];
    for (int i = 0 ; i < 10; i ++) {
        [arr addObject:@{@"date": [NSString stringWithFormat:@"%d-1-2015", i+ 1], @"time": @"09:09:09", @"bet": @"10", @"win": @"10"}];
    }
    return @{@"code": [NSNumber numberWithInt:0], @"data": @{@"content": arr, @"next_url": @"http://google.com"}};
}

@end
