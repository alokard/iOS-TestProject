#import "TPTime.h"
#import "TPCoreDataManager.h"

@implementation TPTime

// Custom logic goes here.
+ (TPTime *)createTime {
    NSManagedObjectContext *context = [[TPCoreDataManager sharedInstance] managedObjectContext];
    NSEntityDescription *entity = [NSEntityDescription entityForName:[self entityName] inManagedObjectContext:context];
    TPTime *result = [[self alloc] initWithEntity:entity insertIntoManagedObjectContext:context];

    return [result autorelease];
}

@end
