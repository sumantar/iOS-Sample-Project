//
//  LDMKTestObserver.m
//  Landmark
//
//  Created by sumantar on 01/10/13.
//  Copyright (c) 2013 cybage. All rights reserved.
//
/*
 With XCode-5, when we run test cases, it does not generate coverage file (.gcda). It only generate gcno, as we set Generate Test Coverage Files and Instrument Program Flow to Yes.
 
 'gcov' used to compare these two files to generate code coverage. Hence there was no code coverage report.
 
 With XCode-5, we need to have a session with simulator to run logic test. And iOS Simulator does not exit apps as normal when running test cases, so not generating .gcda files.
 
 We need tell the tests to flush the coverage data upon finishing test execution by calling the __gcov_flush() C function, for instance in a test suite’s tearDown method.
 
 Need not to do it in each test class. We will do it by hooking testsuite stop method as implemented here.
 
 
 if we want to identify a particular test suite, we can do it as follows:
 
 static id mainSuite = nil;
 
 + (void)testSuiteDidStart:(NSNotification*)notification {
    [super testSuiteDidStart:notification];
 
    SenTestSuiteRun* suite = notification.object;
 
     if (mainSuite == nil) {
        mainSuite = suite;
     }
 }
 
 + (void)testSuiteDidStop:(NSNotification*)notification {
    [super testSuiteDidStop:notification];
 
    SenTestSuiteRun* suite = notification.object;
 
    if (mainSuite == suite) {
        //We can do a specific stuffs here
    }
 }
 
 */
#import <SenTestingKit/SenTestingKit.h>
#import <objc/runtime.h>

extern void __gcov_flush(void);

@interface iOS_Sample_Project_TestObserver : SenTestLog

@end

@implementation iOS_Sample_Project_TestObserver

+ (void)initialize {
    [[NSUserDefaults standardUserDefaults] setValue:@"iOS_Sample_Project_TestObserver" forKey:SenTestObserverClassKey];
    [super initialize];
}

+ (void)testSuiteDidStart:(NSNotification*)notification {
    NSLog(@"Called testSuiteDidStart");
    [super testSuiteDidStart:notification];
}

+ (void)testSuiteDidStop:(NSNotification*)notification {
    NSLog(@"Called testSuiteDidStop");
    [super testSuiteDidStop:notification];
    __gcov_flush();
}

@end
