#import "TPAccountant.h"
#import "TPCoreDataManager.h"

@implementation TPAccountant

// Custom logic goes here.

- (TPAccountantType)type {
    return (TPAccountantType) [self.accountingTypeNumber integerValue];
}

- (void)setType:(TPAccountantType)type {
    self.accountingTypeNumber = [NSNumber numberWithInteger:type];
}

@end
