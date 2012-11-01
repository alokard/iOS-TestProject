//
//  TPCoreDataManager.h
//  TestProject
//
//  Created by Zhenia Tulusha on 08.06.12.
//  Copyright (c) 2012 Tulusha.com. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface TPCoreDataManager : NSObject

@property (nonatomic, strong, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, strong, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;

#pragma mark - static methods

+ (TPCoreDataManager *)sharedInstance;

#pragma mark - other methods
- (void) saveContext;

@end
