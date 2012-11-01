// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to TPDirector.h instead.

#import <CoreData/CoreData.h>
#import "TPBaseEmployeeModel.h"

extern const struct TPDirectorAttributes {
} TPDirectorAttributes;

extern const struct TPDirectorRelationships {
	__unsafe_unretained NSString *availableTimes;
} TPDirectorRelationships;

extern const struct TPDirectorFetchedProperties {
} TPDirectorFetchedProperties;

@class TPTime;


@interface TPDirectorID : NSManagedObjectID {}
@end

@interface _TPDirector : TPBaseEmployeeModel {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (TPDirectorID*)objectID;





@property (nonatomic, strong) NSSet* availableTimes;

- (NSMutableSet*)availableTimesSet;





@end

@interface _TPDirector (CoreDataGeneratedAccessors)

- (void)addAvailableTimes:(NSSet*)value_;
- (void)removeAvailableTimes:(NSSet*)value_;
- (void)addAvailableTimesObject:(TPTime*)value_;
- (void)removeAvailableTimesObject:(TPTime*)value_;

@end

@interface _TPDirector (CoreDataGeneratedPrimitiveAccessors)



- (NSMutableSet*)primitiveAvailableTimes;
- (void)setPrimitiveAvailableTimes:(NSMutableSet*)value;


@end
