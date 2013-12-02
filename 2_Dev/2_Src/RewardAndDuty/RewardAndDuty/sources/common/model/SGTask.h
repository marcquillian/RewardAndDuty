//
//  SGTask.h
//  RewardAndDuty
//
//  Created by Jerome Mare on 01/12/2013.
//  Copyright (c) 2013 Jerome Mare. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef NS_ENUM(NSInteger, PlayerStateType) {
    PlayerStateOff,
    PlayerStatePlaying,
    PlayerStatePaused
};


@interface SGTask : NSObject

/** Title of the task */
@property NSString* name;

/** Value in points of the task
 We use the fibonaci serie as for Scrum estimation method:
 0.5 1 2 3 5 8 13 20 */
@property int points;

/**
 Initialize the object
 @return the initialized task
 */
- (id)init;

/**
 Initialize the object with predefined name
 @param name name of the task
 @return the initialized task
 */
- (id)initWithName:(NSString*)name;

/**
 Initialize the object with predefined name
 @param name name of the task
 @return the initialized task
 */
- (id)initWithName:(NSString*)name andPoints:(int) points;

/**
 Compare two Tasks
 @param id object to compare with
 @return YES if object are equal
 */
-(BOOL)isEqual:(id)object;


/**
 Display the information of the task for debug and log purpose
 @return The textual description of the task
 */
-(NSString *)description;

@end
