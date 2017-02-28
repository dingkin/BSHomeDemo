//
//  NSString+BSTime.m
//  BSHome
//
//  Created by DING on 17/2/26.
//  Copyright © 2017年 DING. All rights reserved.
//

#import "NSString+BSTime.h"

@implementation NSString (BSTime)

- (NSString *)timeFormatFromSeconds:(NSInteger)seconds {
    
    //format of hour
    
    NSString *str_hour = [NSString stringWithFormat:@"%02ld",seconds / 3600];
    
    //format of minute
    
    NSString *str_minute = [NSString stringWithFormat:@"%02ld",(seconds % 3600) / 60];
    
    //format of second
    
    NSString *str_second = [NSString stringWithFormat:@"%02ld",seconds % 60];
    
    //format of time
    
    NSString *format_time = [NSString stringWithFormat:@"%@:%@:%@", str_hour, str_minute, str_second];
    
    return format_time;
    
}
@end
