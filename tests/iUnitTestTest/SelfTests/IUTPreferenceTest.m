//
//  IUTPreferenceTest.m
//  iUnitTestTest
//
//  Created by Katsuyoshi Ito on 09/02/26.
//  Copyright 2009 ITO SOFT DESIGN Inc. All rights reserved.
//

#import "IUTPreferenceTest.h"



@implementation IUTPreferenceTest

@synthesize passedTestsSetting;

- (void)setUp
{
    [super setUp];
    preference = [[IUTPreference sharedPreference] retain];
    runFailuresOnlySetting = preference.isRunFailuresOnly;
    
    // backut originaly settings
    passedTestsSetting = [preference.passedTests copy];
    [preference clearPassedTests];
}

- (void)tearDown
{
    // revert settings
    [preference clearPassedTests];
    for (NSString *key in [passedTestsSetting allKeys]) {
        [preference.passedTests setObject:[passedTestsSetting objectForKey:key] forKey:key];
    }
    self.runFailuresOnly = runFailuresOnlySetting;
    
    [passedTestsSetting release];
    [preference release];
    [super tearDown];
}

- (void)dealloc
{
    [super dealloc];
}


#pragma mark -
#pragma mark Helpers

- (void)setRunFailuresOnly:(BOOL)value
{
    [[NSUserDefaults standardUserDefaults] setBool:value forKey:@"RUN_FAILURES_ONLY"];
}

- (BOOL)runFailuresOnly
{
    return NO;
}

#pragma mark -
#pragma mark Tests

- (void)testAddPassedTestWithRunFailuresOnly
{
    self.runFailuresOnly = YES;
    [preference addPassedTest:@"Foo" methodName:@"method1:"];
    ASSERT(![preference needsTest:@"Foo" methodName:@"method1:"]);
    ASSERT([preference needsTest:@"Foo" methodName:@"method"]);
    ASSERT([preference needsTest:@"Bar" methodName:@"method1:"]);
}

- (void)testAddPassedTestWithoutRunFailuresOnly
{
    self.runFailuresOnly = NO;
    [preference addPassedTest:@"Foo" methodName:@"method1:"];
    ASSERT([preference needsTest:@"Foo" methodName:@"method1:"]);
    ASSERT([preference needsTest:@"Foo" methodName:@"method"]);
    ASSERT([preference needsTest:@"Bar" methodName:@"method1:"]);
}

- (void)testCanClear
{
    self.runFailuresOnly = YES;
    // Although There is no registed test, It can't clear.
    ASSERT(!preference.canClear);
    // Although There is a registed test, It can clear.
    [preference addPassedTest:@"Foo" methodName:@"method1:"];
    ASSERT(preference.canClear);

    self.runFailuresOnly = NO;
    // It always can't clear.
    ASSERT(!preference.canClear);
}

@end
