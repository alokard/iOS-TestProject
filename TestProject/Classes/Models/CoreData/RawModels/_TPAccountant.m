// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to TPAccountant.m instead.

#import "_TPAccountant.h"

const struct TPAccountantAttributes TPAccountantAttributes = {
	.accountingTypeNumber = @"accountingTypeNumber",
};

const struct TPAccountantRelationships TPAccountantRelationships = {
};

const struct TPAccountantFetchedProperties TPAccountantFetchedProperties = {
};

@implementation TPAccountantID
@end

@implementation _TPAccountant

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"TPAccountant" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"TPAccountant";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"TPAccountant" inManagedObjectContext:moc_];
}

- (TPAccountantID*)objectID {
	return (TPAccountantID*)[super objectID];
}

+ (NSSet *)keyPathsForValuesAffectingValueForKey:(NSString *)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"accountingTypeNumberValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"accountingTypeNumber"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
	}

	return keyPaths;
}




@dynamic accountingTypeNumber;



- (int16_t)accountingTypeNumberValue {
	NSNumber *result = [self accountingTypeNumber];
	return [result shortValue];
}

- (void)setAccountingTypeNumberValue:(int16_t)value_ {
	[self setAccountingTypeNumber:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveAccountingTypeNumberValue {
	NSNumber *result = [self primitiveAccountingTypeNumber];
	return [result shortValue];
}

- (void)setPrimitiveAccountingTypeNumberValue:(int16_t)value_ {
	[self setPrimitiveAccountingTypeNumber:[NSNumber numberWithShort:value_]];
}










@end
