//
//  SGTask.m
//  RewardAndDuty
//
//  Created by Jerome Mare on 03/12/2013.
//  Copyright (c) 2013 Jerome Mare. All rights reserved.
//

#import "SGTask.h"


@implementation SGTask

@dynamic name;
@dynamic points;


- (NSString*) description
{
    NSMutableString *description = [[NSMutableString alloc] init];
    [description appendString:@"--- Task Model ---\n"];
    [description appendFormat:@"name: %@\n", self.name];
    [description appendFormat:@"points: %d\n", [self.points integerValue]];
    
    return description;
}

@end
