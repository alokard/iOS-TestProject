// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to TPEmployee.h instead.

#import <CoreData/CoreData.h>
#import "TPBaseEmployeeModel.h"

extern const struct TPEmployeeAttributes {
	__unsafe_unretained NSString *workingPlaceNumber;
} TPEmployeeAttributes;

extern const struct TPEmployeeRelationships {
	__unsafe_unretained NSString *dinnerTime;
} TPEmployeeRelationships;

extern const struct TPEmployeeFetchedProperties {
} TPEmployeeFetchedProperties;

@class TPTime;



@interface TPEmployeeID : NSManagedObjectID {}
@end

@interface _TPEmployee : TPBaseEmployeeModel {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (TPEmployeeID*)objectID;




@property (nonatomic, strong) NSString* workingPlaceNumber;


//- (BOOL)validateWorkingPlaceNumber:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) TPTime* dinnerTime;

//- (BOOL)validateDinnerTime:(id*)value_ error:(NSError**)error_;





@end

@interface _TPEmployee (CoreDataGeneratedAccessors)

@end

@interface _TPEmployee (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveWorkingPlaceNumber;
- (void)setPrimitiveWorkingPlaceNumber:(NSString*)value;





- (TPTime*)primitiveDinnerTime;
- (void)setPrimitiveDinnerTime:(TPTime*)value;


@end
