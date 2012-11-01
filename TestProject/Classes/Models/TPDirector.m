#import "TPDirector.h"
#import "TPTime.h"

@implementation TPDirector

// Custom logic goes here.

- (void)setStartAvailableTime:(NSDate *)date {
    if (!self.availableTime) {
        [self setAvailableTime:[TPTime createTime]];
    }
    self.availableTime.startTime = date;
}

- (void)setEndAvailableTime:(NSDate *)date {
    if (!self.availableTime) {
        [self setAvailableTime:[TPTime createTime]];
    }
    self.availableTime.endTime = date;
}

@end
