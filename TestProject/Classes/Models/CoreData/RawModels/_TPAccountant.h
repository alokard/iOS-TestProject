// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to TPAccountant.h instead.

#import <CoreData/CoreData.h>
#import "TPEmployee.h"

extern const struct TPAccountantAttributes {
	__unsafe_unretained NSString *accountingTypeNumber;
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




@property (nonatomic, strong) NSNumber* accountingTypeNumber;


@property int16_t accountingTypeNumberValue;
- (int16_t)accountingTypeNumberValue;
- (void)setAccountingTypeNumberValue:(int16_t)value_;

//- (BOOL)validateAccountingTypeNumber:(id*)value_ error:(NSError**)error_;






@end

@interface _TPAccountant (CoreDataGeneratedAccessors)

@end

@interface _TPAccountant (CoreDataGeneratedPrimitiveAccessors)


- (NSNumber*)primitiveAccountingTypeNumber;
- (void)setPrimitiveAccountingTypeNumber:(NSNumber*)value;

- (int16_t)primitiveAccountingTypeNumberValue;
- (void)setPrimitiveAccountingTypeNumberValue:(int16_t)value_;




@end
