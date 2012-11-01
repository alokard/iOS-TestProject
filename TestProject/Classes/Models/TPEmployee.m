#import "TPEmployee.h"
#import "TPTime.h"

@implementation TPEmployee

// Custom logic goes here.
- (void)setStartDinnerTime:(NSDate *)date {
    if (!self.dinnerTime) {
        [self setDinnerTime:[TPTime createTime]];
    }
    self.dinnerTime.startTime = date;
}

- (void)setEndDinnerTime:(NSDate *)date {
    if (!self.dinnerTime) {
        [self setDinnerTime:[TPTime createTime]];
    }
    self.dinnerTime.endTime = date;
}

@end
