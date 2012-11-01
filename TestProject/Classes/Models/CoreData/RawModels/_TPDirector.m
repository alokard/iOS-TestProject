// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to TPDirector.m instead.

#import "_TPDirector.h"

const struct TPDirectorAttributes TPDirectorAttributes = {
};

const struct TPDirectorRelationships TPDirectorRelationships = {
	.availableTime = @"availableTime",
};

const struct TPDirectorFetchedProperties TPDirectorFetchedProperties = {
};

@implementation TPDirectorID
@end

@implementation _TPDirector

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"TPDirector" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"TPDirector";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"TPDirector" inManagedObjectContext:moc_];
}

- (TPDirectorID*)objectID {
	return (TPDirectorID*)[super objectID];
}

+ (NSSet *)keyPathsForValuesAffectingValueForKey:(NSString *)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic availableTime;

	






@end
