//
//  TPDateHelper.m
//  TestProject
//
//  Created by Zhenia on 11/01/12.
//  Copyright (c) 2012 Tulusha.com. All rights reserved.
//

#import "TPDateHelper.h"

@implementation TPDateHelper

+ (NSString *)stringIntervalFromTime:(NSDate *)fromTime toTime:(NSDate *)toTime {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"HH:mm"];
    NSString *result = [NSString stringWithFormat:@"%@ - %@",
                                                  [formatter stringFromDate:fromTime],
                                                  [formatter stringFromDate:toTime]];
    [formatter release];

    return result;
}

@end
