//
//  SGTaskTest.m
//  RewardAndDuty
//
//  Created by Jerome Mare on 02/12/2013.
//  Copyright (c) 2013 Jerome Mare. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "SGTask.h"


@interface SGTaskTest : XCTestCase

@end

@implementation SGTaskTest

- (void)setUp
{
    [super setUp];
    // Put setup code here; it will be run once, before the first test case.
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

- (void)testInit
{
    SGTask* task1 = [[SGTask alloc] init];
    XCTAssertNotNil(task1, @"SGTask Init: not correctly implemented");
    
    NSString* task2Name = @"test2";
    NSString* task3Name = @"test3";
    SGTask* task2 = [[SGTask alloc] initWithName:task2Name];
    SGTask* task3 = [[SGTask alloc] initWithName:task3Name];
    XCTAssertNotNil(task2, @"SGTask InitWithName: not correctly implemented");
    XCTAssertEqual(task2.name, task2Name, @"Task name %@ is not equal to %@", task2.name, task2Name);
    XCTAssertNotEqual(task3.name, task2Name, @"Task name %@ is equal to %@", task3.name, task2Name);
    
    NSString* task4Name = @"test4";
    int task4Points = 4;
    SGTask* task4 = [[SGTask alloc] initWithName:task4Name andPoints:task4Points];
    XCTAssertNotNil(task4, @"SGTask InitWithName: andPoints: not correctly implemented");
    XCTAssertEqual(task4.name, task4Name, @"Task name %@ is not equal to %@", task4.name, task4Name);
    XCTAssertEqual(task4.points, task4Points, @"Task name %d is not equal to %d", task4.points, task4Points);
    
}

@end
