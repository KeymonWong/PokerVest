//
//  OKCoreDataStorageModule.h
//  PokerVest
//
//  Created by keymon on 2018/11/25.
//  Copyright © 2018 KeymonWong. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <CoreData/CoreData.h>
#import "VDConfigEngine.h"

NS_ASSUME_NONNULL_BEGIN

@interface OKCoreDataStorageModule : NSObject<VDConfigEngineProtocol>
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;
@end

NS_ASSUME_NONNULL_END
