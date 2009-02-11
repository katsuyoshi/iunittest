//
//  SenTestAssertionTest.m
//  iUnitTest
//
//  Created by Katsuyoshi Ito on 09/02/03.
//  Copyright 2009 ITO SOFT DESIGN Inc. All rights reserved.
//

#import "SenTestAssertionTest.h"

#define AssertFailExceptionName @"AssertFailException"


@implementation SenTestAssertionTest

- (void)setUp
{
    [super setUp];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)dealloc
{
    [super dealloc];
}


#pragma mark -
#pragma mark Helpers


#pragma mark -
#pragma mark Tests


#pragma mark nil

- (void)testSTAssertNilSuccess
{
    STAssertNil(nil, nil);
}

- (void)testSTAssertNilFail
{
    @try {
        STAssertNil(@"abc", nil);
        @throw [NSException exceptionWithName:AssertFailExceptionName reason:NSStringFromSelector(_cmd) userInfo:nil];
    }
    @catch (NSException * e) {
        if ([[e name] isEqualToString:AssertFailExceptionName]) {
            @throw;
        }
    }
}

- (void)testSTAssertNotNilSuccess
{
    STAssertNotNil(@"abc", nil);
}

- (void)testSTAssertNotNilFail
{
    @try {
        STAssertNotNil(nil, nil);
        @throw [NSException exceptionWithName:AssertFailExceptionName reason:NSStringFromSelector(_cmd) userInfo:nil];
    }
    @catch (NSException * e) {
        if ([[e name] isEqualToString:AssertFailExceptionName]) {
            @throw;
        }
    }
}


#pragma mark true or false

- (void)testSTAssertTrueSuccess
{
    STAssertTrue(YES, nil);
}

- (void)testSTAssertTrueFail
{
    @try {
        STAssertTrue(NO, nil);
        @throw [NSException exceptionWithName:AssertFailExceptionName reason:NSStringFromSelector(_cmd) userInfo:nil];
    }
    @catch (NSException * e) {
        if ([[e name] isEqualToString:AssertFailExceptionName]) {
            @throw;
        }
    }
}

- (void)testSTAssertFalseSuccess
{
    STAssertFalse(NO, nil);
}

- (void)testSTAssertFalseFail
{
    @try {
        STAssertFalse(YES, nil);
        @throw [NSException exceptionWithName:AssertFailExceptionName reason:NSStringFromSelector(_cmd) userInfo:nil];
    }
    @catch (NSException * e) {
        if ([[e name] isEqualToString:AssertFailExceptionName]) {
            @throw;
        }
    }
}



#pragma mark object

- (void)testSTAssertEqualObjectsSuccess
{
    STAssertEqualObjects(@"abc", @"abc", nil);
}

- (void)testSTAssertEqualObjectsFail
{
    @try {
        STAssertEqualObjects(@"abc", @"def", nil);
        @throw [NSException exceptionWithName:AssertFailExceptionName reason:NSStringFromSelector(_cmd) userInfo:nil];
    }
    @catch (NSException * e) {
        if ([[e name] isEqualToString:AssertFailExceptionName]) {
            @throw;
        }
    }
}


#pragma mark scalas

- (void)testSTAssertEqualsSuccess
{
    STAssertEquals(10, 10, nil);
    STAssertEquals(10.0f, 10.0f, nil);
    STAssertEquals(10.0, 10.0, nil);
}

- (void)testSTAssertEqualsFailIntCase
{
    @try {
        STAssertEquals(10, 11, nil);
        @throw [NSException exceptionWithName:AssertFailExceptionName reason:NSStringFromSelector(_cmd) userInfo:nil];
    }
    @catch (NSException * e) {
        if ([[e name] isEqualToString:AssertFailExceptionName]) {
            @throw;
        }
    }
}


- (void)testSTAssertEqualsFailFloatCase
{
    @try {
        STAssertEquals(10.0f, 11.0f, nil);
        @throw [NSException exceptionWithName:AssertFailExceptionName reason:NSStringFromSelector(_cmd) userInfo:nil];
    }
    @catch (NSException * e) {
        if ([[e name] isEqualToString:AssertFailExceptionName]) {
            @throw;
        }
    }
}

- (void)testSTAssertEqualsFailDoubleCase
{
    @try {
        STAssertEquals(10.0, 11.0, nil);
        @throw [NSException exceptionWithName:AssertFailExceptionName reason:NSStringFromSelector(_cmd) userInfo:nil];
    }
    @catch (NSException * e) {
        if ([[e name] isEqualToString:AssertFailExceptionName]) {
            @throw;
        }
    }
}

- (void)testSTAssertEqualsFailUnsupportedCase
{
    @try {
        STAssertEquals((char)10, (char)10, nil);
        @throw [NSException exceptionWithName:AssertFailExceptionName reason:NSStringFromSelector(_cmd) userInfo:nil];
    }
    @catch (NSException * e) {
        if ([[e name] isEqualToString:AssertFailExceptionName]) {
            @throw;
        }
    }
}



- (void)testSTAssertEqualsWithAccuracySuccess
{
    STAssertEqualsWithAccuracy(10.0f, 11.0f, 1.0f, nil);
    STAssertEqualsWithAccuracy(10.0, 11.0, 1.0, nil);
}


- (void)testSTAssertEqualsWithAccuracyFailFloatCase
{
    @try {
        STAssertEqualsWithAccuracy(10.0f, 11.0f, 0.5f, nil);
        @throw [NSException exceptionWithName:AssertFailExceptionName reason:NSStringFromSelector(_cmd) userInfo:nil];
    }
    @catch (NSException * e) {
        if ([[e name] isEqualToString:AssertFailExceptionName]) {
            @throw;
        }
    }
}

- (void)testSTAssertEqualsWithAccuracyFailDoubleCase
{
    @try {
        STAssertEqualsWithAccuracy(10.0, 11.0, 0.5, nil);
        @throw [NSException exceptionWithName:AssertFailExceptionName reason:NSStringFromSelector(_cmd) userInfo:nil];
    }
    @catch (NSException * e) {
        if ([[e name] isEqualToString:AssertFailExceptionName]) {
            @throw;
        }
    }
}

- (void)testSTAssertEqualsWithAccuracyFailUnsupportedCase
{
    @try {
        STAssertEqualsWithAccuracy(10, 11, 1, nil);
        @throw [NSException exceptionWithName:AssertFailExceptionName reason:NSStringFromSelector(_cmd) userInfo:nil];
    }
    @catch (NSException * e) {
        if ([[e name] isEqualToString:AssertFailExceptionName]) {
            @throw;
        }
    }
}

- (void)testSTFail
{
    @try {
        STFail(@"assert");
        @throw [NSException exceptionWithName:AssertFailExceptionName reason:NSStringFromSelector(_cmd) userInfo:nil];
    }
    @catch (NSException * e) {
        if ([[e name] isEqualToString:AssertFailExceptionName]) {
            @throw;
        } else {
            IUTAssertionInfo *info = [[e userInfo] objectForKey:IUTAssertionInfoKey];
            ASSERT_EQUAL(@"assert", info.message);
        }
    }
}

- (void)testSTFailWithArg
{
    @try {
        STFail(@"assert %d %s %@", 10, "abcd", @"efgh");
        @throw [NSException exceptionWithName:AssertFailExceptionName reason:NSStringFromSelector(_cmd) userInfo:nil];
    }
    @catch (NSException * e) {
        if ([[e name] isEqualToString:AssertFailExceptionName]) {
            @throw;
        } else {
            IUTAssertionInfo *info = [[e userInfo] objectForKey:IUTAssertionInfoKey];
            ASSERT_EQUAL(@"assert 10 abcd efgh", info.message);
        }
    }
}

- (void)testSTAssertThrowsSuccess
{
    STAssertThrows(@throw @"exception", nil);
    STAssertThrows(@throw @"exception";, nil);
}

- (void)testSTAssertThrowsFail
{
    do {
        @try {
            STAssertThrows(NSLog(@"exception"), nil);
            STAssertThrows(NSLog(@"exception");, nil);
        }
        @catch (NSException * e) {
            continue;
        }
        ASSERT_FAIL(@"expected exception but nothing.");
    } while(0);
}

- (void)testSTAssertNoThrowSuccess
{
    STAssertNoThrow(NSLog(@"exception"), nil);
    STAssertNoThrow(NSLog(@"exception");, nil);
}

- (void)testSTAssertNoThrowFail
{
    do {
        @try {
            STAssertNoThrow(@throw @"exception", nil);
            STAssertNoThrow(@throw @"exception";, nil);
        }
        @catch (NSException * e) {
            continue;
        }
        ASSERT_FAIL(@"exception raised");
    } while(0);
}


@end
