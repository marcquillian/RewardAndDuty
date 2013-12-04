//
//  SGTask.h
//  RewardAndDuty
//
//  Created by Jerome Mare on 03/12/2013.
//  Copyright (c) 2013 Jerome Mare. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface SGTask : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * points;

@end
