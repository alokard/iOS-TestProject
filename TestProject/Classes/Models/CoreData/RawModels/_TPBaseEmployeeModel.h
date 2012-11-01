// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to TPBaseEmployeeModel.h instead.

#import <CoreData/CoreData.h>


extern const struct TPBaseEmployeeModelAttributes {
	__unsafe_unretained NSString *name;
	__unsafe_unretained NSString *order;
	__unsafe_unretained NSString *salary;
} TPBaseEmployeeModelAttributes;

extern const struct TPBaseEmployeeModelRelationships {
} TPBaseEmployeeModelRelationships;

extern const struct TPBaseEmployeeModelFetchedProperties {
} TPBaseEmployeeModelFetchedProperties;






@interface TPBaseEmployeeModelID : NSManagedObjectID {}
@end

@interface _TPBaseEmployeeModel : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (TPBaseEmployeeModelID*)objectID;




@property (nonatomic, strong) NSString* name;


//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSNumber* order;


@property int64_t orderValue;
- (int64_t)orderValue;
- (void)setOrderValue:(int64_t)value_;

//- (BOOL)validateOrder:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSNumber* salary;


@property double salaryValue;
- (double)salaryValue;
- (void)setSalaryValue:(double)value_;

//- (BOOL)validateSalary:(id*)value_ error:(NSError**)error_;






@end

@interface _TPBaseEmployeeModel (CoreDataGeneratedAccessors)

@end

@interface _TPBaseEmployeeModel (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;




- (NSNumber*)primitiveOrder;
- (void)setPrimitiveOrder:(NSNumber*)value;

- (int64_t)primitiveOrderValue;
- (void)setPrimitiveOrderValue:(int64_t)value_;




- (NSNumber*)primitiveSalary;
- (void)setPrimitiveSalary:(NSNumber*)value;

- (double)primitiveSalaryValue;
- (void)setPrimitiveSalaryValue:(double)value_;




@end
