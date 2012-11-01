// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to TPDirector.h instead.

#import <CoreData/CoreData.h>
#import "TPBaseEmployeeModel.h"

extern const struct TPDirectorAttributes {
} TPDirectorAttributes;

extern const struct TPDirectorRelationships {
	__unsafe_unretained NSString *availableTime;
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





@property (nonatomic, strong) TPTime* availableTime;

//- (BOOL)validateAvailableTime:(id*)value_ error:(NSError**)error_;





@end

@interface _TPDirector (CoreDataGeneratedAccessors)

@end

@interface _TPDirector (CoreDataGeneratedPrimitiveAccessors)



- (TPTime*)primitiveAvailableTime;
- (void)setPrimitiveAvailableTime:(TPTime*)value;


@end
