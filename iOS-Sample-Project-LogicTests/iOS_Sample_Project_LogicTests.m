//
//  iOS_Sample_Project_LogicTests.m
//  iOS-Sample-Project-LogicTests
//
//  Created by sumantar on 09/10/13.
//  Copyright (c) 2013 sumantar. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>

@interface iOS_Sample_Project_LogicTests : SenTestCase

@end

@implementation iOS_Sample_Project_LogicTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample
{
    
    STAssertEquals(@"Just Checking", @"Just Checking", nil);
}

@end
