// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to TPAccountant.h instead.

#import <CoreData/CoreData.h>
#import "TPEmployee.h"

extern const struct TPAccountantAttributes {
	__unsafe_unretained NSString *accountingType;
} TPAccountantAttributes;

extern const struct TPAccountantRelationships {
} TPAccountantRelationships;

extern const struct TPAccountantFetchedProperties {
} TPAccountantFetchedProperties;




@interface TPAccountantID : NSManagedObjectID {}
@end

@interface _TPAccountant : TPEmployee {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (TPAccountantID*)objectID;




@property (nonatomic, strong) NSNumber* accountingType;


@property int16_t accountingTypeValue;
- (int16_t)accountingTypeValue;
- (void)setAccountingTypeValue:(int16_t)value_;

//- (BOOL)validateAccountingType:(id*)value_ error:(NSError**)error_;






@end

@interface _TPAccountant (CoreDataGeneratedAccessors)

@end

@interface _TPAccountant (CoreDataGeneratedPrimitiveAccessors)


- (NSNumber*)primitiveAccountingType;
- (void)setPrimitiveAccountingType:(NSNumber*)value;

- (int16_t)primitiveAccountingTypeValue;
- (void)setPrimitiveAccountingTypeValue:(int16_t)value_;




@end
