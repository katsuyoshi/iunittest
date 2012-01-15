//
//  NSExceptionTest.m
//  iUnitTestTest
//
//  Created by Katsuyoshi Ito on 09/05/14.
//  Copyright 2009 ITO SOFT DESIGN Inc. All rights reserved.
//

#import "NSExceptionTest.h"
#import "NSExceptionExtension.h"
#import "IUTAssertion.h"
#import "IUTTestRunner.h"


@implementation NSExceptionTest

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

- (NSException *)failureException
{
    return [NSException exceptionWithName:IUTAssertionExceptionName reason:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:IUTASSERTION_INF(nil), IUTAssertionInfoKey, nil]];
}

- (NSException *)failureException2
{
    IUTAssertionInfo *info = [IUTAssertionInfo assertionInfoWithClass:[self class] selector:@selector(testThisClassAlways) message:@"message" filePath:[[[NSString alloc] initWithCString:__FILE__ encoding:NSUTF8StringEncoding] autorelease] line:__LINE__];
    return [NSException exceptionWithName:IUTAssertionExceptionName reason:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:info, IUTAssertionInfoKey, nil]];
}

- (NSException *)errorException
{
    return [NSException exceptionWithName:IUTAssertionErrorExceptionName reason:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:IUTASSERTION_INF(nil), IUTAssertionInfoKey, nil]];
}

- (NSException *)exception
{
    return [NSException exceptionWithName:@"name" reason:@"reason" userInfo:nil];
}

#pragma mark -
#pragma mark Tests

- (void)testAssertionInfo
{
    ASSERT_NOT_NIL([self failureException].assertionInfo);
    ASSERT_NOT_NIL([self errorException].assertionInfo);
    ASSERT_NIL([self exception].assertionInfo);
}

- (void)testIsFailure
{
    ASSERT([self failureException].isFailure);
    ASSERT(![self errorException].isFailure);
    ASSERT(![self exception].isFailure);
}

- (void)testIsError
{
    ASSERT(![self failureException].isError);
    ASSERT([self errorException].isError);
    ASSERT(![self exception].isError);
}

- (void)testColor
{
    ASSERT_EQUAL([IUTTestRunner failureColor], [self failureException].color);
    ASSERT_EQUAL([IUTTestRunner failureColor2], [self failureException2].color);
    ASSERT_EQUAL([IUTTestRunner errorColor], [self errorException].color);
    ASSERT_NIL([self exception].color);
}


#pragma mark -
#pragma mark Option

// Uncomment it, if you want to test this class except other passed test classes.
//#define TESTS_ALWAYS
#ifdef TESTS_ALWAYS
- (void)testThisClassAlways { ASSERT_FAIL(@"fail always"); }
+ (BOOL)forceTestsAnyway { return YES; }
#endif

@end
