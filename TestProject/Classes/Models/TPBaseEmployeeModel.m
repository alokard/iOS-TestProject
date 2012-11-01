#import "TPBaseEmployeeModel.h"
#import "TPCoreDataManager.h"

@implementation TPBaseEmployeeModel

// Custom logic goes here.

+ (id)createEmployeeWithName:(NSString *)aName {
    NSManagedObjectContext *context = [[TPCoreDataManager sharedInstance] managedObjectContext];
    NSEntityDescription *entity = [NSEntityDescription entityForName:[self entityName] inManagedObjectContext:context];
    TPBaseEmployeeModel *result = [[self alloc] initWithEntity:entity insertIntoManagedObjectContext:context];
    result.name = aName;
    result.creationDate = [NSDate date];

    return [result autorelease];
}

+ (NSMutableArray *)allObjects {
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:[self entityName]];
    [request setIncludesSubentities:NO];
    NSManagedObjectContext *context = [[TPCoreDataManager sharedInstance] managedObjectContext];
    NSSortDescriptor *orderDescriptor = [[NSSortDescriptor alloc] initWithKey:@"order" ascending:YES];
    NSSortDescriptor *dateDescriptor = [[NSSortDescriptor alloc] initWithKey:@"creationDate" ascending:NO];
    request.sortDescriptors = @[orderDescriptor, dateDescriptor];
    [orderDescriptor release];
    [dateDescriptor release];

    NSMutableArray *result = [NSMutableArray arrayWithArray:[context executeFetchRequest:request error:nil]];

    return result;
}

@end
