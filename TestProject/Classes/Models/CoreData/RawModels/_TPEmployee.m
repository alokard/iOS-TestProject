// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to TPEmployee.m instead.

#import "_TPEmployee.h"

const struct TPEmployeeAttributes TPEmployeeAttributes = {
	.workingPlaceNumber = @"workingPlaceNumber",
};

const struct TPEmployeeRelationships TPEmployeeRelationships = {
	.dinnerTime = @"dinnerTime",
};

const struct TPEmployeeFetchedProperties TPEmployeeFetchedProperties = {
};

@implementation TPEmployeeID
@end

@implementation _TPEmployee

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"TPEmployee" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"TPEmployee";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"TPEmployee" inManagedObjectContext:moc_];
}

- (TPEmployeeID*)objectID {
	return (TPEmployeeID*)[super objectID];
}

+ (NSSet *)keyPathsForValuesAffectingValueForKey:(NSString *)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic workingPlaceNumber;






@dynamic dinnerTime;

	






@end
