// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to TPTime.m instead.

#import "_TPTime.h"

const struct TPTimeAttributes TPTimeAttributes = {
	.endTime = @"endTime",
	.startTime = @"startTime",
};

const struct TPTimeRelationships TPTimeRelationships = {
};

const struct TPTimeFetchedProperties TPTimeFetchedProperties = {
};

@implementation TPTimeID
@end

@implementation _TPTime

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"TPTime" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"TPTime";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"TPTime" inManagedObjectContext:moc_];
}

- (TPTimeID*)objectID {
	return (TPTimeID*)[super objectID];
}

+ (NSSet *)keyPathsForValuesAffectingValueForKey:(NSString *)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic endTime;






@dynamic startTime;











@end
