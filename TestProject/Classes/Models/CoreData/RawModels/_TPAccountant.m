// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to TPAccountant.m instead.

#import "_TPAccountant.h"

const struct TPAccountantAttributes TPAccountantAttributes = {
	.accountingType = @"accountingType",
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
	
	if ([key isEqualToString:@"accountingTypeValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"accountingType"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
	}

	return keyPaths;
}




@dynamic accountingType;



- (int16_t)accountingTypeValue {
	NSNumber *result = [self accountingType];
	return [result shortValue];
}

- (void)setAccountingTypeValue:(int16_t)value_ {
	[self setAccountingType:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveAccountingTypeValue {
	NSNumber *result = [self primitiveAccountingType];
	return [result shortValue];
}

- (void)setPrimitiveAccountingTypeValue:(int16_t)value_ {
	[self setPrimitiveAccountingType:[NSNumber numberWithShort:value_]];
}










@end
