// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to TPTime.h instead.

#import <CoreData/CoreData.h>


extern const struct TPTimeAttributes {
	__unsafe_unretained NSString *endTime;
	__unsafe_unretained NSString *startTime;
} TPTimeAttributes;

extern const struct TPTimeRelationships {
} TPTimeRelationships;

extern const struct TPTimeFetchedProperties {
} TPTimeFetchedProperties;





@interface TPTimeID : NSManagedObjectID {}
@end

@interface _TPTime : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (TPTimeID*)objectID;




@property (nonatomic, strong) NSDate* endTime;


//- (BOOL)validateEndTime:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSDate* startTime;


//- (BOOL)validateStartTime:(id*)value_ error:(NSError**)error_;






@end

@interface _TPTime (CoreDataGeneratedAccessors)

@end

@interface _TPTime (CoreDataGeneratedPrimitiveAccessors)


- (NSDate*)primitiveEndTime;
- (void)setPrimitiveEndTime:(NSDate*)value;




- (NSDate*)primitiveStartTime;
- (void)setPrimitiveStartTime:(NSDate*)value;




@end
