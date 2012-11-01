#import "TPBaseEmployeeModel.h"
#import "TPCoreDataManager.h"

@implementation TPBaseEmployeeModel

// Custom logic goes here.

+ (id)createEmployeeWithName:(NSString *)aName {
    NSString *entityName = NSStringFromClass([self class]);
    NSManagedObjectContext *context = [[TPCoreDataManager sharedInstance] managedObjectContext];
    NSEntityDescription *entity = [NSEntityDescription entityForName:entityName inManagedObjectContext:context];
    TPBaseEmployeeModel *result = [[self alloc] initWithEntity:entity insertIntoManagedObjectContext:context];
    result.name = aName;

    return [result autorelease];
}

+ (NSMutableArray *)allObjects {
    NSString *entityName = NSStringFromClass([self class]);
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:entityName];
    [request setIncludesSubentities:NO];
    NSManagedObjectContext *context = [[TPCoreDataManager sharedInstance] managedObjectContext];
    NSSortDescriptor *orderDescriptor = [[NSSortDescriptor alloc] initWithKey:@"order" ascending:YES];
    request.sortDescriptors = @[orderDescriptor];
    [orderDescriptor release];

    NSMutableArray *result = [NSMutableArray arrayWithArray:[context executeFetchRequest:request error:nil]];
    return result;
}


@end
