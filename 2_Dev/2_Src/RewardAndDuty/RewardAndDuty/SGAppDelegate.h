//
//  SGAppDelegate.h
//  RewardAndDuty
//
//  Created by Jerome Mare on 01/12/2013.
//  Copyright (c) 2013 Jerome Mare. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SGAppDelegate : UIResponder <UIApplicationDelegate>


@property (strong, nonatomic) UIWindow *window;

/** List of tasks displayed in the application - used once data persistence is not available */
@property (strong, nonatomic) NSMutableArray* tasks;


@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator ;


- (NSString *)applicationDocumentsDirectory;


@end
