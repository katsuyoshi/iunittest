//
//  IUTTestRunnerTest.m
//  iUnitTest
//
//  Created by Katsuyoshi Ito on 09/01/17.
//  Copyright 2009 ITO SOFT DESIGN Inc. All rights reserved.
//

#import "IUTTestRunnerTest.h"
#import "IUTAssertionInfoTest.h"
#import "IUTAssertionTest.h"
#import "IUTTestTest.h"
#import "IUTTestRunnerTest.h"
#import "IUTTestRunnerViewController.h"


@implementation IUTTestRunnerTest

- (void)setUp
{
    [super setUp];
    runner = [IUTTestRunnerMock new];
    [runner.fails removeAllObjects];
    [runner.errors removeAllObjects];
}

- (void)tearDown
{
    [runner release];
    runner = nil;
    [super tearDown];
}

- (void)dealloc
{
    [runner release];
    [super dealloc];
}

- (BOOL)containsClass:(Class)klass
{
    for(id obj in runner.sites) {
        if ([obj isMemberOfClass:klass]) {
            return YES;
        }
    }
    return NO;
}

- (void)testCollectSites
{
    ASSERT_NOT_EQUAL_INT(0, [runner.sites count]);
    // collect sites that is inherited from IUTTest
    ASSERT([self containsClass:[IUTAssertionInfoTest class]]);
    ASSERT([self containsClass:[IUTAssertionTest class]]);
    ASSERT([self containsClass:[IUTTestTest class]]);
    ASSERT([self containsClass:[IUTTestRunnerTest class]]);

    // but don't collect sites that have no test
    ASSERT(![self containsClass:[IUTAssertion class]]);
    ASSERT(![self containsClass:[IUTTest class]]);
    
    // don't collect sites that is not inherited from IUTTest
    ASSERT(![self containsClass:[IUTTestRunner class]]);
    ASSERT(![self containsClass:[IUTTestRunnerViewController class]]);
    ASSERT(![self containsClass:[NSArray class]]);
}

- (void)testResultWithCaseZero
{
    ASSERT_EQUAL(@"0 test, 0 assertion, 0 failure, 0 error", runner.result);
}

- (void)testResultWithCaseOne
{
    [runner.tests addObject:@"a"];
    [runner.fails addObject:@"a"];
    [runner.errors addObject:@"a"];
    runner.assertedCount = 1;
    ASSERT_EQUAL(@"1 test, 1 assertion, 1 failure, 1 error", runner.result);
}

- (void)testResultWithCaseTwo
{
    [runner.tests addObject:@"a"];
    [runner.tests addObject:@"a"];
    [runner.fails addObject:@"a"];
    [runner.fails addObject:@"a"];
    [runner.errors addObject:@"a"];
    [runner.errors addObject:@"a"];
    runner.assertedCount = 2;
    ASSERT_EQUAL(@"2 tests, 2 assertions, 2 failures, 2 errors", runner.result);
}

- (void)testBeforeTest
{
    ASSERT(!runner.isPassed);
    ASSERT(!runner.hasErrors);
    ASSERT(!runner.hasFailures);
    ASSERT_EQUAL(runner.idleColor, runner.backgroundColor);
}

- (void)testWasAllSuccessed
{
    [runner.passes addObject:@"a"];
    ASSERT(runner.isPassed);
    ASSERT_EQUAL(runner.successColor, runner.backgroundColor);
}

- (void)testHasFailuers
{
    ASSERT(!runner.hasFailures);
    [runner.fails addObject:@"a"];
    ASSERT(runner.hasFailures);
    ASSERT_EQUAL(runner.failureColor, runner.backgroundColor);
}

- (void)testHasErrors
{
    ASSERT(!runner.hasErrors);
    [runner.errors addObject:@"a"];
    ASSERT(runner.hasErrors);
    ASSERT_EQUAL(runner.errorColor, runner.backgroundColor);
}

@end
