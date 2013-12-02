//
//  SGTask.m
//  RewardAndDuty
//
//  Created by Jerome Mare on 01/12/2013.
//  Copyright (c) 2013 Jerome Mare. All rights reserved.
//

#import "SGTask.h"

@implementation SGTask


- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    return self;
}

- (id)initWithName:(NSString*)name
{
    self = [super init];
    if (self) {
        self.name = name;
    }
    return self;
}

- (id)initWithName:(NSString*)name andPoints:(int) points
{
    self = [super init];
    if (self) {
        self.name = name;
        self.points = points;
    }
    return self;
}


-(BOOL)isEqual:(id)object
{
    if([object isKindOfClass:self.class]){
        SGTask *objectToCompare = (SGTask*)object;
        return self.name == objectToCompare.name;
    } else {
        return [super isEqual:object];
    }
}

-(NSString *)description
{
    NSMutableString *description = [[NSMutableString alloc] init];
    [description appendString:@"--- Task Model ---\n"];
    [description appendFormat:@"name: %@\n", self.name];
    [description appendFormat:@"points: %d\n", self.points];
    
    return description;
}



@end
