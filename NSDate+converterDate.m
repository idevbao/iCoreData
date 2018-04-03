//
//  NSDate+converterDate.m
//  iCoreData
//
//  Created by Trúc Phương >_< on 02/04/2018.
//  Copyright © 2018 iDev Bao. All rights reserved.
//

#import "NSDate+converterDate.h"

@implementation NSDate (converterDate)
+(NSDate*)converterDate:(int)day month:(int)month year:(int)year{
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeZone:[NSTimeZone systemTimeZone]];
    [dateFormatter setDateFormat:@"yyyy/MM/dd HH:mm"];
    NSDate *dateConverted = [dateFormatter dateFromString:[NSString stringWithFormat:@"%d/%d/%d 00:00",year,month,day]];
    NSLog(@"%@",dateConverted);
    return dateConverted;
}
@end





