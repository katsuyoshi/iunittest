//
//  IUTAssertionTest.m
//  iUnitTest
//
//  Created by Katsuyoshi Ito on 09/01/16.
//  Copyright 2009 ITO SOFT DESIGN Inc. All rights reserved.
//

#import "IUTAssertionTest.h"

#define AssertFailExceptionName @"AssertFailException"

@implementation IUTAssertionTest

#pragma mark -
#pragma mark throwing test

#pragma mark boolean

- (void)testAssertWithYes
{
    @try {
        ASSERT(YES);
    }
    @catch (NSException * e) {
        @throw;
    }
}

- (void)testAssertWithNo
{
    @try {
        ASSERT(NO);
        @throw [NSException exceptionWithName:AssertFailExceptionName reason:NSStringFromSelector(_cmd) userInfo:nil];
    }
    @catch (NSException * e) {
        if ([[e name] isEqualToString:AssertFailExceptionName]) {
            @throw;
        }
    }
}

- (void)testAssertFail
{
    @try {
        ASSERT_FAIL(@"fail");
        @throw [NSException exceptionWithName:AssertFailExceptionName reason:NSStringFromSelector(_cmd) userInfo:nil];
    }
    @catch (NSException * e) {
        if ([[e name] isEqualToString:AssertFailExceptionName]) {
            @throw;
        }
    }
}


#pragma mark object

- (void)testAssertSameSuccess
{
    @try {
        ASSERT_SAME(@"abc", @"abc");
    }
    @catch (NSException * e) {
        @throw;
    }
}

- (void)testAssertSameSuccessWithNil
{
    @try {
        ASSERT_SAME(nil, nil);
    }
    @catch (NSException * e) {
        @throw;
    }
}

- (void)testAssertSameFail
{
    @try {
        ASSERT_SAME([NSArray arrayWithObject:@"abc"], [NSArray arrayWithObject:@"abc"]);
        @throw [NSException exceptionWithName:AssertFailExceptionName reason:NSStringFromSelector(_cmd) userInfo:nil];
    }
    @catch (NSException * e) {
        if ([[e name] isEqualToString:AssertFailExceptionName]) {
            @throw;
        }
    }
}

- (void)testAssertSameFailWithNil
{
    @try {
        ASSERT_SAME(nil, [NSArray arrayWithObject:@"abc"]);
        @throw [NSException exceptionWithName:AssertFailExceptionName reason:NSStringFromSelector(_cmd) userInfo:nil];
    }
    @catch (NSException * e) {
        if ([[e name] isEqualToString:AssertFailExceptionName]) {
            @throw;
        }
    }
}

- (void)testAssertNotSameSuccess
{
    @try {
        ASSERT_NOT_SAME([NSArray arrayWithObject:@"abc"], [NSArray arrayWithObject:@"abc"]);
    }
    @catch (NSException * e) {
        @throw;
    }
}

- (void)testAssertNotSameSuccessWithNil
{
    @try {
        ASSERT_NOT_SAME(nil, @"def");
    }
    @catch (NSException * e) {
        @throw;
    }
}

- (void)testAssertNotSameFail
{
    @try {
        ASSERT_NOT_SAME(@"abc", @"abc");
        @throw [NSException exceptionWithName:AssertFailExceptionName reason:NSStringFromSelector(_cmd) userInfo:nil];
    }
    @catch (NSException * e) {
        if ([[e name] isEqualToString:AssertFailExceptionName]) {
            @throw;
        }
    }
}

- (void)testAssertNotSameFailWithNil
{
    @try {
        ASSERT_NOT_SAME(nil, nil);
        @throw [NSException exceptionWithName:AssertFailExceptionName reason:NSStringFromSelector(_cmd) userInfo:nil];
    }
    @catch (NSException * e) {
        if ([[e name] isEqualToString:AssertFailExceptionName]) {
            @throw;
        }
    }
}


- (void)testAssertEqualSuccess
{
    @try {
        ASSERT_EQUAL(@"abc", @"abc");
        ASSERT_EQUAL([NSArray arrayWithObject:@"abc"], [NSArray arrayWithObject:@"abc"]);
    }
    @catch (NSException * e) {
        @throw;
    }
}

- (void)testAssertEqualSuccessWithNil
{
    @try {
        ASSERT_EQUAL(nil, nil);
    }
    @catch (NSException * e) {
        @throw;
    }
}

- (void)testAssertEqualFail
{
    @try {
        ASSERT_EQUAL(@"abc", @"def");
        @throw [NSException exceptionWithName:AssertFailExceptionName reason:NSStringFromSelector(_cmd) userInfo:nil];
    }
    @catch (NSException * e) {
        if ([[e name] isEqualToString:AssertFailExceptionName]) {
            @throw;
        }
    }
}

- (void)testAssertEqualFailWithNil
{
    @try {
        ASSERT_EQUAL(nil, @"def");
        @throw [NSException exceptionWithName:AssertFailExceptionName reason:NSStringFromSelector(_cmd) userInfo:nil];
    }
    @catch (NSException * e) {
        if ([[e name] isEqualToString:AssertFailExceptionName]) {
            @throw;
        }
    }
}

#pragma mark int

- (void)testAssertEqualIntSuccess
{
    @try {
        ASSERT_EQUAL_INT(123, 123);
    }
    @catch (NSException * e) {
        @throw;
    }
}

- (void)testAssertEqualIntFail
{
    @try {
        ASSERT_EQUAL_INT(123, 124);
        @throw [NSException exceptionWithName:AssertFailExceptionName reason:NSStringFromSelector(_cmd) userInfo:nil];
    }
    @catch (NSException * e) {
        if ([[e name] isEqualToString:AssertFailExceptionName]) {
            @throw;
        }
    }
}


#pragma mark float

- (void)testAssertEqualFloatSuccess
{
    @try {
        ASSERT_EQUAL_FLOAT(123.4, 123.4);
    }
    @catch (NSException * e) {
        @throw;
    }
}

- (void)testAssertEqualFloatFail
{
    @try {
        ASSERT_EQUAL_FLOAT(123.4, 123.5);
        @throw [NSException exceptionWithName:AssertFailExceptionName reason:NSStringFromSelector(_cmd) userInfo:nil];
    }
    @catch (NSException * e) {
        if ([[e name] isEqualToString:AssertFailExceptionName]) {
            @throw;
        }
    }
}

- (void)testAssertEqualFloatDeltaSuccess
{
    @try {
        ASSERT_EQUAL_FLOAT_DELTA(123.4, 123.5, 0.1);
        ASSERT_EQUAL_FLOAT_DELTA(123.4, 123.3, 0.1);
    }
    @catch (NSException * e) {
        @throw;
    }
}

- (void)testAssertEqualFloatDeltaFail1
{
    @try {
        ASSERT_EQUAL_FLOAT_DELTA(123.4, 123.51, 0.1);
        @throw [NSException exceptionWithName:AssertFailExceptionName reason:NSStringFromSelector(_cmd) userInfo:nil];
    }
    @catch (NSException * e) {
        if ([[e name] isEqualToString:AssertFailExceptionName]) {
            @throw;
        }
    }
}

- (void)testAssertEqualFloatDeltaFail2
{
    @try {
        ASSERT_EQUAL_FLOAT_DELTA(123.4, 122.9, 0.1);
        @throw [NSException exceptionWithName:AssertFailExceptionName reason:NSStringFromSelector(_cmd) userInfo:nil];
    }
    @catch (NSException * e) {
        if ([[e name] isEqualToString:AssertFailExceptionName]) {
            @throw;
        }
    }
}


#pragma mark double

- (void)testAssertEqualDoubleSuccess
{
    @try {
        ASSERT_EQUAL_DOUBLE(123.4, 123.4);
    }
    @catch (NSException * e) {
        @throw;
    }
}

- (void)testAssertEqualDoubleFail
{
    @try {
        ASSERT_EQUAL_DOUBLE(123.4, 123.5);
        @throw [NSException exceptionWithName:AssertFailExceptionName reason:NSStringFromSelector(_cmd) userInfo:nil];
    }
    @catch (NSException * e) {
        if ([[e name] isEqualToString:AssertFailExceptionName]) {
            @throw;
        }
    }
}

- (void)testAssertEqualDoubleDeltaSuccess
{
    @try {
        ASSERT_EQUAL_DOUBLE_DELTA(123.4, 123.5, 0.1);
        ASSERT_EQUAL_DOUBLE_DELTA(123.4, 123.3, 0.1);
    }
    @catch (NSException * e) {
        @throw;
    }
}

- (void)testAssertEqualDoubleDeltaFail1
{
    @try {
        ASSERT_EQUAL_DOUBLE_DELTA(123.4, 123.51, 0.1);
        @throw [NSException exceptionWithName:AssertFailExceptionName reason:NSStringFromSelector(_cmd) userInfo:nil];
    }
    @catch (NSException * e) {
        if ([[e name] isEqualToString:AssertFailExceptionName]) {
            @throw;
        }
    }
}

- (void)testAssertEqualDoubleDeltaFail2
{
    @try {
        ASSERT_EQUAL_DOUBLE_DELTA(123.4, 122.9, 0.1);
        @throw [NSException exceptionWithName:AssertFailExceptionName reason:NSStringFromSelector(_cmd) userInfo:nil];
    }
    @catch (NSException * e) {
        if ([[e name] isEqualToString:AssertFailExceptionName]) {
            @throw;
        }
    }
}


#pragma mark point

- (void)testAssertEqualPointSuccess
{
    @try {
        ASSERT_EQUAL_POINT(CGPointMake(0, 1), CGPointMake(0, 1));
    }
    @catch (NSException * e) {
        @throw;
    }
}

- (void)testAssertEqualPointFail1
{
    @try {
        ASSERT_EQUAL_POINT(CGPointMake(1, 1), CGPointMake(0, 1));
        @throw [NSException exceptionWithName:AssertFailExceptionName reason:NSStringFromSelector(_cmd) userInfo:nil];
    }
    @catch (NSException * e) {
        if ([[e name] isEqualToString:AssertFailExceptionName]) {
            @throw;
        }
    }
}

- (void)testAssertEqualPointFail2
{
    @try {
        ASSERT_EQUAL_POINT(CGPointMake(0, 2), CGPointMake(0, 1));
        @throw [NSException exceptionWithName:AssertFailExceptionName reason:NSStringFromSelector(_cmd) userInfo:nil];
    }
    @catch (NSException * e) {
        if ([[e name] isEqualToString:AssertFailExceptionName]) {
            @throw;
        }
    }
}


#pragma mark size

- (void)testAssertEqualSizeSuccess
{
    @try {
        ASSERT_EQUAL_SIZE(CGSizeMake(0, 1), CGSizeMake(0, 1));
    }
    @catch (NSException * e) {
        @throw;
    }
}

- (void)testAssertEqualSizeFail1
{
    @try {
        ASSERT_EQUAL_SIZE(CGSizeMake(1, 1), CGSizeMake(0, 1));
        @throw [NSException exceptionWithName:AssertFailExceptionName reason:NSStringFromSelector(_cmd) userInfo:nil];
    }
    @catch (NSException * e) {
        if ([[e name] isEqualToString:AssertFailExceptionName]) {
            @throw;
        }
    }
}

- (void)testAssertEqualSizeFail2
{
    @try {
        ASSERT_EQUAL_SIZE(CGSizeMake(0, 2), CGSizeMake(0, 1));
        @throw [NSException exceptionWithName:AssertFailExceptionName reason:NSStringFromSelector(_cmd) userInfo:nil];
    }
    @catch (NSException * e) {
        if ([[e name] isEqualToString:AssertFailExceptionName]) {
            @throw;
        }
    }
}


#pragma mark rect

- (void)testAssertEqualRectSuccess
{
    @try {
        ASSERT_EQUAL_RECT(CGRectMake(0, 1, 2, 3), CGRectMake(0, 1, 2, 3));
    }
    @catch (NSException * e) {
        @throw;
    }
}

- (void)testAssertEqualRectFail1
{
    @try {
        ASSERT_EQUAL_RECT(CGRectMake(1, 1, 2, 3), CGRectMake(0, 1, 2, 3));
        @throw [NSException exceptionWithName:AssertFailExceptionName reason:NSStringFromSelector(_cmd) userInfo:nil];
    }
    @catch (NSException * e) {
        if ([[e name] isEqualToString:AssertFailExceptionName]) {
            @throw;
        }
    }
}

- (void)testAssertEqualRectFail2
{
    @try {
        ASSERT_EQUAL_RECT(CGRectMake(0, 2, 2, 3), CGRectMake(0, 1, 2, 3));
        @throw [NSException exceptionWithName:AssertFailExceptionName reason:NSStringFromSelector(_cmd) userInfo:nil];
    }
    @catch (NSException * e) {
        if ([[e name] isEqualToString:AssertFailExceptionName]) {
            @throw;
        }
    }
}

- (void)testAssertEqualRectFail3
{
    @try {
        ASSERT_EQUAL_RECT(CGRectMake(0, 1, 3, 3), CGRectMake(0, 1, 2, 3));
        @throw [NSException exceptionWithName:AssertFailExceptionName reason:NSStringFromSelector(_cmd) userInfo:nil];
    }
    @catch (NSException * e) {
        if ([[e name] isEqualToString:AssertFailExceptionName]) {
            @throw;
        }
    }
}

- (void)testAssertEqualRectFail4
{
    @try {
        ASSERT_EQUAL_RECT(CGRectMake(0, 1, 2, 4), CGRectMake(0, 1, 2, 3));
        @throw [NSException exceptionWithName:AssertFailExceptionName reason:NSStringFromSelector(_cmd) userInfo:nil];
    }
    @catch (NSException * e) {
        if ([[e name] isEqualToString:AssertFailExceptionName]) {
            @throw;
        }
    }
}



#pragma mark -
#pragma mark information test

- (void)testAssertInfo
{
    int line;
    @try {
        line = __LINE__; ASSERT(NO);
        @throw [NSException exceptionWithName:AssertFailExceptionName reason:NSStringFromSelector(_cmd) userInfo:nil];
    }
    @catch (NSException * e) {
        if ([[e name] isEqualToString:AssertFailExceptionName]) {
            @throw;
        } else {
            IUTAssertionInfo *info = [[e userInfo] objectForKey:IUTAssertionInfoKey];
            ASSERT_EQUAL(@"NO", info.actual);
            ASSERT_EQUAL(@"YES", info.expected);
            ASSERT_EQUAL_INT(line, info.line);
            ASSERT_EQUAL(@"IUTAssertionTest.m", info.fileName);
            ASSERT_EQUAL(@"IUTAssertionTest", info.className);
            ASSERT_EQUAL(@"testAssertInfo", info.methodName);
            ASSERT_EQUAL(@"expected:YES but was:NO", info.message); 
        }
    }
}

- (void)testAssertFailInfo
{
    int line;
    @try {
        line = __LINE__; ASSERT_FAIL(@"fail");
        @throw [NSException exceptionWithName:AssertFailExceptionName reason:NSStringFromSelector(_cmd) userInfo:nil];
    }
    @catch (NSException * e) {
        if ([[e name] isEqualToString:AssertFailExceptionName]) {
            @throw;
        } else {
            IUTAssertionInfo *info = [[e userInfo] objectForKey:IUTAssertionInfoKey];
            ASSERT_EQUAL_INT(line, info.line);
            ASSERT_EQUAL(@"IUTAssertionTest.m", info.fileName);
            ASSERT_EQUAL(@"IUTAssertionTest", info.className);
            ASSERT_EQUAL(@"testAssertFailInfo", info.methodName);
            ASSERT_EQUAL(@"fail", info.message); 
        }
    }
}

- (void)testAssertSameInfo
{
    int line;
    @try {
        line = __LINE__; ASSERT_SAME(@"abc", @"def");
        @throw [NSException exceptionWithName:AssertFailExceptionName reason:NSStringFromSelector(_cmd) userInfo:nil];
    }
    @catch (NSException * e) {
        if ([[e name] isEqualToString:AssertFailExceptionName]) {
            @throw;
        } else {
            IUTAssertionInfo *info = [[e userInfo] objectForKey:IUTAssertionInfoKey];
            ASSERT_EQUAL(@"def", info.actual);
            ASSERT_EQUAL(@"abc", info.expected);
            ASSERT_EQUAL_INT(line, info.line);
            ASSERT_EQUAL(@"IUTAssertionTest.m", info.fileName);
            ASSERT_EQUAL(@"IUTAssertionTest", info.className);
            ASSERT_EQUAL(@"testAssertSameInfo", info.methodName);
            ASSERT_EQUAL(@"expected:abc but was:def", info.message); 
        }
    }
}

- (void)testAssertNotSameInfo
{
    int line;
    @try {
        line = __LINE__; ASSERT_NOT_SAME(@"abc", @"abc");
        @throw [NSException exceptionWithName:AssertFailExceptionName reason:NSStringFromSelector(_cmd) userInfo:nil];
    }
    @catch (NSException * e) {
        if ([[e name] isEqualToString:AssertFailExceptionName]) {
            @throw;
        } else {
            IUTAssertionInfo *info = [[e userInfo] objectForKey:IUTAssertionInfoKey];
            ASSERT_EQUAL(@"abc", info.actual);
            ASSERT_EQUAL(@"abc", info.expected);
            ASSERT_EQUAL_INT(line, info.line);
            ASSERT_EQUAL(@"IUTAssertionTest.m", info.fileName);
            ASSERT_EQUAL(@"IUTAssertionTest", info.className);
            ASSERT_EQUAL(@"testAssertNotSameInfo", info.methodName);
            ASSERT_EQUAL(@"expected:not abc but was:abc", info.message); 
        }
    }
}

- (void)testAssertEqualInfo
{
    int line;
    @try {
        line = __LINE__; ASSERT_EQUAL(@"abc", @"def");
        @throw [NSException exceptionWithName:AssertFailExceptionName reason:NSStringFromSelector(_cmd) userInfo:nil];
    }
    @catch (NSException * e) {
        if ([[e name] isEqualToString:AssertFailExceptionName]) {
            @throw;
        } else {
            IUTAssertionInfo *info = [[e userInfo] objectForKey:IUTAssertionInfoKey];
            ASSERT_EQUAL(@"def", info.actual);
            ASSERT_EQUAL(@"abc", info.expected);
            ASSERT_EQUAL_INT(line, info.line);
            ASSERT_EQUAL(@"IUTAssertionTest.m", info.fileName);
            ASSERT_EQUAL(@"IUTAssertionTest", info.className);
            ASSERT_EQUAL(@"testAssertEqualInfo", info.methodName);
            ASSERT_EQUAL(@"expected:abc but was:def", info.message); 
        }
    }
}

- (void)testAssertNotEqualInfo
{
    int line;
    @try {
        line = __LINE__; ASSERT_NOT_EQUAL(@"abc", @"abc");
        @throw [NSException exceptionWithName:AssertFailExceptionName reason:NSStringFromSelector(_cmd) userInfo:nil];
    }
    @catch (NSException * e) {
        if ([[e name] isEqualToString:AssertFailExceptionName]) {
            @throw;
        } else {
            IUTAssertionInfo *info = [[e userInfo] objectForKey:IUTAssertionInfoKey];
            ASSERT_EQUAL(@"abc", info.actual);
            ASSERT_EQUAL(@"abc", info.expected);
            ASSERT_EQUAL_INT(line, info.line);
            ASSERT_EQUAL(@"IUTAssertionTest.m", info.fileName);
            ASSERT_EQUAL(@"IUTAssertionTest", info.className);
            ASSERT_EQUAL(@"testAssertNotEqualInfo", info.methodName);
            ASSERT_EQUAL(@"expected:not abc but was:abc", info.message); 
        }
    }
}

- (void)testAssertEqualIntInfo
{
    int line;
    @try {
        line = __LINE__; ASSERT_EQUAL_INT(123, 124);
        @throw [NSException exceptionWithName:AssertFailExceptionName reason:NSStringFromSelector(_cmd) userInfo:nil];
    }
    @catch (NSException * e) {
        if ([[e name] isEqualToString:AssertFailExceptionName]) {
            @throw;
        } else {
            IUTAssertionInfo *info = [[e userInfo] objectForKey:IUTAssertionInfoKey];
            ASSERT_EQUAL([NSNumber numberWithInt:124], info.actual);
            ASSERT_EQUAL([NSNumber numberWithInt:123], info.expected);
            ASSERT_EQUAL_INT(line, info.line);
            ASSERT_EQUAL(@"IUTAssertionTest.m", info.fileName);
            ASSERT_EQUAL(@"IUTAssertionTest", info.className);
            ASSERT_EQUAL(@"testAssertEqualIntInfo", info.methodName);
            ASSERT_EQUAL(@"expected:123 but was:124", info.message); 
        }
    }
}

- (void)testAssertNotEqualIntInfo
{
    int line;
    @try {
        line = __LINE__; ASSERT_NOT_EQUAL_INT(123, 123);
        @throw [NSException exceptionWithName:AssertFailExceptionName reason:NSStringFromSelector(_cmd) userInfo:nil];
    }
    @catch (NSException * e) {
        if ([[e name] isEqualToString:AssertFailExceptionName]) {
            @throw;
        } else {
            IUTAssertionInfo *info = [[e userInfo] objectForKey:IUTAssertionInfoKey];
            ASSERT_EQUAL([NSNumber numberWithInt:123], info.actual);
            ASSERT_EQUAL([NSNumber numberWithInt:123], info.expected);
            ASSERT_EQUAL_INT(line, info.line);
            ASSERT_EQUAL(@"IUTAssertionTest.m", info.fileName);
            ASSERT_EQUAL(@"IUTAssertionTest", info.className);
            ASSERT_EQUAL(@"testAssertNotEqualIntInfo", info.methodName);
            ASSERT_EQUAL(@"expected:not 123 but was:123", info.message); 
        }
    }
}

- (void)testAssertEqualFloatInfo
{
    int line;
    @try {
        line = __LINE__; ASSERT_EQUAL_FLOAT(123.4, 123.5);
        @throw [NSException exceptionWithName:AssertFailExceptionName reason:NSStringFromSelector(_cmd) userInfo:nil];
    }
    @catch (NSException * e) {
        if ([[e name] isEqualToString:AssertFailExceptionName]) {
            @throw;
        } else {
            IUTAssertionInfo *info = [[e userInfo] objectForKey:IUTAssertionInfoKey];
            ASSERT_EQUAL([NSNumber numberWithFloat:123.5], info.actual);
            ASSERT_EQUAL([NSNumber numberWithFloat:123.4], info.expected);
            ASSERT_EQUAL_INT(line, info.line);
            ASSERT_EQUAL(@"IUTAssertionTest.m", info.fileName);
            ASSERT_EQUAL(@"IUTAssertionTest", info.className);
            ASSERT_EQUAL(@"testAssertEqualFloatInfo", info.methodName);
            ASSERT_EQUAL(@"expected:123.4 but was:123.5", info.message); 
        }
    }
}

- (void)testAssertNotEqualFloatInfo
{
    int line;
    @try {
        line = __LINE__; ASSERT_NOT_EQUAL_FLOAT(123.4, 123.4);
        @throw [NSException exceptionWithName:AssertFailExceptionName reason:NSStringFromSelector(_cmd) userInfo:nil];
    }
    @catch (NSException * e) {
        if ([[e name] isEqualToString:AssertFailExceptionName]) {
            @throw;
        } else {
            IUTAssertionInfo *info = [[e userInfo] objectForKey:IUTAssertionInfoKey];
            ASSERT_EQUAL([NSNumber numberWithFloat:123.4], info.actual);
            ASSERT_EQUAL([NSNumber numberWithFloat:123.4], info.expected);
            ASSERT_EQUAL_INT(line, info.line);
            ASSERT_EQUAL(@"IUTAssertionTest.m", info.fileName);
            ASSERT_EQUAL(@"IUTAssertionTest", info.className);
            ASSERT_EQUAL(@"testAssertNotEqualFloatInfo", info.methodName);
            ASSERT_EQUAL(@"expected:not 123.4 but was:123.4", info.message); 
        }
    }
}

- (void)testAssertEqualFloatDeltaInfo
{
    int line;
    @try {
        line = __LINE__; ASSERT_EQUAL_FLOAT_DELTA(123.4, 123.51, 0.1);
        @throw [NSException exceptionWithName:AssertFailExceptionName reason:NSStringFromSelector(_cmd) userInfo:nil];
    }
    @catch (NSException * e) {
        if ([[e name] isEqualToString:AssertFailExceptionName]) {
            @throw;
        } else {
            IUTAssertionInfo *info = [[e userInfo] objectForKey:IUTAssertionInfoKey];
            ASSERT_EQUAL([NSNumber numberWithFloat:123.51], info.actual);
            ASSERT_EQUAL([NSNumber numberWithFloat:123.4], info.expected);
            ASSERT_EQUAL([NSNumber numberWithFloat:0.1], info.delta);
            ASSERT_EQUAL_INT(line, info.line);
            ASSERT_EQUAL(@"IUTAssertionTest.m", info.fileName);
            ASSERT_EQUAL(@"IUTAssertionTest", info.className);
            ASSERT_EQUAL(@"testAssertEqualFloatDeltaInfo", info.methodName);
            ASSERT_EQUAL(@"expected:123.4 but was:123.51 delta:0.1", info.message); 
        }
    }
}

- (void)testAssertEqualDoubletInfo
{
    int line;
    @try {
        line = __LINE__; ASSERT_EQUAL_DOUBLE(123.4, 123.5);
        @throw [NSException exceptionWithName:AssertFailExceptionName reason:NSStringFromSelector(_cmd) userInfo:nil];
    }
    @catch (NSException * e) {
        if ([[e name] isEqualToString:AssertFailExceptionName]) {
            @throw;
        } else {
            IUTAssertionInfo *info = [[e userInfo] objectForKey:IUTAssertionInfoKey];
            ASSERT_EQUAL_DOUBLE(123.5, [info.actual doubleValue]);
            ASSERT_EQUAL_DOUBLE(123.4000015258789, [info.expected doubleValue]);
            ASSERT_EQUAL_INT(line, info.line);
            ASSERT_EQUAL(@"IUTAssertionTest.m", info.fileName);
            ASSERT_EQUAL(@"IUTAssertionTest", info.className);
            ASSERT_EQUAL(@"testAssertEqualDoubletInfo", info.methodName);
            ASSERT_EQUAL(@"expected:123.4000015258789 but was:123.5", info.message); 
        }
    }
}

- (void)testAssertNotEqualDoubletInfo
{
    int line;
    @try {
        line = __LINE__; ASSERT_NOT_EQUAL_DOUBLE(123.4, 123.4);
        @throw [NSException exceptionWithName:AssertFailExceptionName reason:NSStringFromSelector(_cmd) userInfo:nil];
    }
    @catch (NSException * e) {
        if ([[e name] isEqualToString:AssertFailExceptionName]) {
            @throw;
        } else {
            IUTAssertionInfo *info = [[e userInfo] objectForKey:IUTAssertionInfoKey];
            ASSERT_EQUAL_DOUBLE(123.4000015258789, [info.actual doubleValue]);
            ASSERT_EQUAL_DOUBLE(123.4000015258789, [info.expected doubleValue]);
            ASSERT_EQUAL_INT(line, info.line);
            ASSERT_EQUAL(@"IUTAssertionTest.m", info.fileName);
            ASSERT_EQUAL(@"IUTAssertionTest", info.className);
            ASSERT_EQUAL(@"testAssertNotEqualDoubletInfo", info.methodName);
            ASSERT_EQUAL(@"expected:not 123.4000015258789 but was:123.4000015258789", info.message); 
        }
    }
}

- (void)testAssertEqualDoubletDeltaInfo
{
    int line;
    @try {
        line = __LINE__; ASSERT_EQUAL_DOUBLE_DELTA(123.4, 123.51, 0.1);
        @throw [NSException exceptionWithName:AssertFailExceptionName reason:NSStringFromSelector(_cmd) userInfo:nil];
    }
    @catch (NSException * e) {
        if ([[e name] isEqualToString:AssertFailExceptionName]) {
            @throw;
        } else {
            IUTAssertionInfo *info = [[e userInfo] objectForKey:IUTAssertionInfoKey];
            ASSERT_EQUAL_DOUBLE(123.5100021362305, [info.actual doubleValue]);
            ASSERT_EQUAL_DOUBLE(123.4000015258789, [info.expected doubleValue]);
            ASSERT_EQUAL_DOUBLE(0.1, [info.delta doubleValue]);
            ASSERT_EQUAL_INT(line, info.line);
            ASSERT_EQUAL(@"IUTAssertionTest.m", info.fileName);
            ASSERT_EQUAL(@"IUTAssertionTest", info.className);
            ASSERT_EQUAL(@"testAssertEqualDoubletDeltaInfo", info.methodName);
            ASSERT_EQUAL(@"expected:123.4000015258789 but was:123.5100021362305 delta:0.1000000014901161", info.message); 
        }
    }
}

- (void)testAssertEqualPointInfo
{
    int line;
    @try {
        line = __LINE__; ASSERT_EQUAL_POINT(CGPointMake(0, 1), CGPointMake(0, 2));
        @throw [NSException exceptionWithName:AssertFailExceptionName reason:NSStringFromSelector(_cmd) userInfo:nil];
    }
    @catch (NSException * e) {
        if ([[e name] isEqualToString:AssertFailExceptionName]) {
            @throw;
        } else {
            IUTAssertionInfo *info = [[e userInfo] objectForKey:IUTAssertionInfoKey];
            ASSERT_EQUAL(NSStringFromCGPoint(CGPointMake(0, 2)), info.actual);
            ASSERT_EQUAL(NSStringFromCGPoint(CGPointMake(0, 1)), info.expected);
            ASSERT_EQUAL_INT(line, info.line);
            ASSERT_EQUAL(@"IUTAssertionTest.m", info.fileName);
            ASSERT_EQUAL(@"IUTAssertionTest", info.className);
            ASSERT_EQUAL(@"testAssertEqualPointInfo", info.methodName);
            ASSERT_EQUAL(([NSString stringWithFormat:@"expected:%@ but was:%@", NSStringFromCGPoint(CGPointMake(0, 1)), NSStringFromCGPoint(CGPointMake(0, 2))]), info.message); 
        }
    }
}

- (void)testAssertEqualSizeInfo
{
    int line;
    @try {
        line = __LINE__; ASSERT_EQUAL_SIZE(CGSizeMake(0, 1), CGSizeMake(0, 2));
        @throw [NSException exceptionWithName:AssertFailExceptionName reason:NSStringFromSelector(_cmd) userInfo:nil];
    }
    @catch (NSException * e) {
        if ([[e name] isEqualToString:AssertFailExceptionName]) {
            @throw;
        } else {
            IUTAssertionInfo *info = [[e userInfo] objectForKey:IUTAssertionInfoKey];
            ASSERT_EQUAL(NSStringFromCGSize(CGSizeMake(0, 2)), info.actual);
            ASSERT_EQUAL(NSStringFromCGSize(CGSizeMake(0, 1)), info.expected);
            ASSERT_EQUAL_INT(line, info.line);
            ASSERT_EQUAL(@"IUTAssertionTest.m", info.fileName);
            ASSERT_EQUAL(@"IUTAssertionTest", info.className);
            ASSERT_EQUAL(@"testAssertEqualSizeInfo", info.methodName);
            ASSERT_EQUAL(([NSString stringWithFormat:@"expected:%@ but was:%@", NSStringFromCGSize(CGSizeMake(0, 1)), NSStringFromCGSize(CGSizeMake(0, 2))]), info.message); 
        }
    }
}

- (void)testAssertEqualRectInfo
{
    int line;
    @try {
        line = __LINE__; ASSERT_EQUAL_RECT(CGRectMake(0, 1, 2, 3), CGRectMake(0, 1, 2, 4));
        @throw [NSException exceptionWithName:AssertFailExceptionName reason:NSStringFromSelector(_cmd) userInfo:nil];
    }
    @catch (NSException * e) {
        if ([[e name] isEqualToString:AssertFailExceptionName]) {
            @throw;
        } else {
            IUTAssertionInfo *info = [[e userInfo] objectForKey:IUTAssertionInfoKey];
            ASSERT_EQUAL(NSStringFromCGRect(CGRectMake(0, 1, 2, 4)), info.actual);
            ASSERT_EQUAL(NSStringFromCGRect(CGRectMake(0, 1, 2, 3)), info.expected);
            ASSERT_EQUAL_INT(line, info.line);
            ASSERT_EQUAL(@"IUTAssertionTest.m", info.fileName);
            ASSERT_EQUAL(@"IUTAssertionTest", info.className);
            ASSERT_EQUAL(@"testAssertEqualRectInfo", info.methodName);
            ASSERT_EQUAL(([NSString stringWithFormat:@"expected:%@ but was:%@", NSStringFromCGRect(CGRectMake(0, 1, 2, 3)), NSStringFromCGRect(CGRectMake(0, 1, 2, 4))]), info.message); 
        }
    }
}

- (void)testClearAssertedCount
{
    assertedCount = 123;
    [self clearAssertedCount];
    ASSERT_EQUAL_INT(0, assertedCount);
}


#pragma mark -
#pragma mark increment asserted count test

- (void)testIncrementAtAssert
{
    assertedCount = 0;
    ASSERT(YES);
    ASSERT_EQUAL_INT(1, assertedCount);
}

- (void)testIncrementAtAssertFail
{
    assertedCount = 0;
    @try {
        ASSERT_FAIL(@"fail");
    }
    @catch (NSException * e) {
    }
    ASSERT_EQUAL_INT(1, assertedCount);
}

- (void)testIncrementAtAssertSame
{
    assertedCount = 0;
    ASSERT_SAME(@"abc", @"abc");
    ASSERT_EQUAL_INT(1, assertedCount);
}

- (void)testIncrementAtAssertNotSame
{
    assertedCount = 0;
    ASSERT_NOT_SAME(@"abc", @"def");
    ASSERT_EQUAL_INT(1, assertedCount);
}

- (void)testIncrementAtAssertEqual
{
    assertedCount = 0;
    ASSERT_EQUAL(@"abc", @"abc");
    ASSERT_EQUAL_INT(1, assertedCount);
}

- (void)testIncrementAtAssertNotEqual
{
    assertedCount = 0;
    ASSERT_NOT_EQUAL(@"abc", @"def");
    ASSERT_EQUAL_INT(1, assertedCount);
}

- (void)testIncrementAtAssertEqualWithNil
{
    assertedCount = 0;
    ASSERT_EQUAL(nil, nil);
    ASSERT_EQUAL_INT(1, assertedCount);
}

- (void)testIncrementAtAssertNotEqualWithNil
{
    assertedCount = 0;
    ASSERT_NOT_EQUAL(nil, @"def");
    ASSERT_EQUAL_INT(1, assertedCount);
}

- (void)testIncrementAtAssertEqualInt
{
    assertedCount = 0;
    ASSERT_EQUAL_INT(0, 0);
    ASSERT_EQUAL_INT(1, assertedCount);
}

- (void)testIncrementAtAssertNotEqualInt
{
    assertedCount = 0;
    ASSERT_NOT_EQUAL_INT(0, 1);
    ASSERT_EQUAL_INT(1, assertedCount);
}

- (void)testIncrementAtAssertEqualFloat
{
    assertedCount = 0;
    ASSERT_EQUAL_FLOAT(0.1, 0.1);
    ASSERT_EQUAL_INT(1, assertedCount);
}

- (void)testIncrementAtAssertNotEqualFloat
{
    assertedCount = 0;
    ASSERT_NOT_EQUAL_FLOAT(0.0, 0.1);
    ASSERT_EQUAL_INT(1, assertedCount);
}

- (void)testIncrementAtAssertNotEqualFloatDelta
{
    assertedCount = 0;
    ASSERT_EQUAL_FLOAT_DELTA(0.0, 0.1, 0.2);
    ASSERT_EQUAL_INT(1, assertedCount);
}

- (void)testIncrementAtAssertEqualDouble
{
    assertedCount = 0;
    ASSERT_EQUAL_DOUBLE(0.1, 0.1);
    ASSERT_EQUAL_INT(1, assertedCount);
}

- (void)testIncrementAtAssertNotEqualDouble
{
    assertedCount = 0;
    ASSERT_NOT_EQUAL_DOUBLE(0.0, 0.1);
    ASSERT_EQUAL_INT(1, assertedCount);
}

- (void)testIncrementAtAssertNotEqualDoubleDelta
{
    assertedCount = 0;
    ASSERT_EQUAL_DOUBLE_DELTA(0.0, 0.1, 0.2);
    ASSERT_EQUAL_INT(1, assertedCount);
}

- (void)testIncrementAtAssertPoint
{
    assertedCount = 0;
    ASSERT_EQUAL_POINT(CGPointMake(0, 1), CGPointMake(0, 1));
    ASSERT_EQUAL_INT(1, assertedCount);
}

- (void)testIncrementAtAssertSize
{
    assertedCount = 0;
    ASSERT_EQUAL_SIZE(CGSizeMake(0, 1), CGSizeMake(0, 1));
    ASSERT_EQUAL_INT(1, assertedCount);
}

- (void)testIncrementAtAssertRect
{
    assertedCount = 0;
    ASSERT_EQUAL_RECT(CGRectMake(0, 1, 2, 3), CGRectMake(0, 1, 2, 3));
    ASSERT_EQUAL_INT(1, assertedCount);
}

- (void)testAssertionErrorExceptionFrom
{
    NSException *exception = [NSException exceptionWithName:nil reason:@"test message" userInfo:nil];
    exception = [IUTAssertion assertionErrorExceptionFrom:exception klass:[self class] selectorName:NSStringFromSelector(_cmd)];
    ASSERT_EQUAL(IUTAssertionErrorExceptionName, exception.name);
    IUTAssertionInfo *info = [[exception userInfo] objectForKey:IUTAssertionInfoKey];
    ASSERT_EQUAL(@"test message", info.message);
    ASSERT_EQUAL(@"IUTAssertionTest", info.className);
    ASSERT_EQUAL(@"testAssertionErrorExceptionFrom", info.methodName);
}




@end
