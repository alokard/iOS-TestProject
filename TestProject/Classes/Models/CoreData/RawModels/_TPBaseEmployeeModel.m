// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to TPBaseEmployeeModel.m instead.

#import "_TPBaseEmployeeModel.h"

const struct TPBaseEmployeeModelAttributes TPBaseEmployeeModelAttributes = {
	.creationDate = @"creationDate",
	.name = @"name",
	.order = @"order",
	.salary = @"salary",
};

const struct TPBaseEmployeeModelRelationships TPBaseEmployeeModelRelationships = {
};

const struct TPBaseEmployeeModelFetchedProperties TPBaseEmployeeModelFetchedProperties = {
};

@implementation TPBaseEmployeeModelID
@end

@implementation _TPBaseEmployeeModel

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"TPBaseEmployeeModel" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"TPBaseEmployeeModel";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"TPBaseEmployeeModel" inManagedObjectContext:moc_];
}

- (TPBaseEmployeeModelID*)objectID {
	return (TPBaseEmployeeModelID*)[super objectID];
}

+ (NSSet *)keyPathsForValuesAffectingValueForKey:(NSString *)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"orderValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"order"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
	}
	if ([key isEqualToString:@"salaryValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"salary"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
	}

	return keyPaths;
}




@dynamic creationDate;






@dynamic name;






@dynamic order;



- (int64_t)orderValue {
	NSNumber *result = [self order];
	return [result longLongValue];
}

- (void)setOrderValue:(int64_t)value_ {
	[self setOrder:[NSNumber numberWithLongLong:value_]];
}

- (int64_t)primitiveOrderValue {
	NSNumber *result = [self primitiveOrder];
	return [result longLongValue];
}

- (void)setPrimitiveOrderValue:(int64_t)value_ {
	[self setPrimitiveOrder:[NSNumber numberWithLongLong:value_]];
}





@dynamic salary;



- (double)salaryValue {
	NSNumber *result = [self salary];
	return [result doubleValue];
}

- (void)setSalaryValue:(double)value_ {
	[self setSalary:[NSNumber numberWithDouble:value_]];
}

- (double)primitiveSalaryValue {
	NSNumber *result = [self primitiveSalary];
	return [result doubleValue];
}

- (void)setPrimitiveSalaryValue:(double)value_ {
	[self setPrimitiveSalary:[NSNumber numberWithDouble:value_]];
}










@end
