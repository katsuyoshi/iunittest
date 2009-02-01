//
//  IUTAssertionInfoTest.m
//  iUnitTest
//
//  Created by Katsuyoshi Ito on 09/01/16.
//  Copyright 2009 ITO SOFT DESIGN Inc. All rights reserved.
//

#import "IUTAssertionInfoTest.h"
#import "IUTAssertionInfo.h"


@implementation IUTAssertionInfoTest

- (void)testInitialize
{
    IUTAssertionInfo *info = IUTASSERTIN_INF(@"test message");
    ASSERT_EQUAL_INT(__LINE__ - 1, info.line);
    ASSERT_EQUAL(@"IUTAssertionInfoTest", info.className);
    ASSERT_EQUAL(@"testInitialize", info.methodName);
    ASSERT_EQUAL([[[NSString alloc] initWithCString:__FILE__] autorelease], info.filePath);
    ASSERT_EQUAL(@"IUTAssertionInfoTest.m", info.fileName);
    ASSERT_EQUAL(@"test message", info.message);
}

- (void)testMessageWithMessage
{
    IUTAssertionInfo *info = IUTASSERTIN_INF(@"test message");
    ASSERT_EQUAL(@"test message", info.message);
}

- (void)testMessageWithExpectedAndActual
{
    IUTAssertionInfo *info = IUTASSERTIN_INF(nil);
    info.actual = @"actual";
    info.expected = @"expected";
    ASSERT_EQUAL(@"expected:expected but was:actual", info.message);
}

- (void)testMessageWithExpectedAndActualNagative
{
    IUTAssertionInfo *info = IUTASSERTIN_INF(nil);
    info.actual = @"actual";
    info.expected = @"expected";
    info.negativeCase = YES;
    ASSERT_EQUAL(@"expected:not expected but was:actual", info.message);
}

- (void)testMessageWithExpectedAndActualWithNil
{
    IUTAssertionInfo *info = IUTASSERTIN_INF(nil);
    info.actual = @"actual";
    info.expected = nil;
    ASSERT_EQUAL(@"expected:(null) but was:actual", info.message);
}

- (void)testMessageWithExpectedAndActualNagativeWithNil
{
    IUTAssertionInfo *info = IUTASSERTIN_INF(nil);
    info.actual = @"actual";
    info.expected = nil;
    info.negativeCase = YES;
    ASSERT_EQUAL(@"expected:not (null) but was:actual", info.message);
}

- (void)testMessageWithExpectedAndActualDelta
{
    IUTAssertionInfo *info = IUTASSERTIN_INF(nil);
    info.actual = @"actual";
    info.expected = @"expected";
    info.delta = @"0.1";
    ASSERT_EQUAL(@"expected:expected but was:actual delta:0.1", info.message);
}


- (void)testReason
{
    IUTAssertionInfo *info = IUTASSERTIN_INF(@"test message");
    NSString *expected = [NSString stringWithFormat:@"IUTAssertionInfoTest.m:%d\n-[IUTAssertionInfoTest testReason]\ntest message", __LINE__ - 1];
    ASSERT_EQUAL(expected, info.reason);
}


@end
