//
//  PerformSetUpSequenceTest.m
//  iUnitTestTest
//
//  Created by Katsuyoshi Ito on 09/11/17.
//  Copyright 2009 ITO SOFT DESIGN Inc. All rights reserved.
//

#import "PerformSetUpSequenceTest.h"



@implementation PerformSetUpSequenceTest

- (void)setUp
{
    [super setUp];
    foo = [Foo new];
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    [notificationCenter addObserver:self selector:@selector(fooDidChange:) name:FooDidChangeNotification object:foo];
    notifiedCount = 0;
    
//    [self performSetUpSequence:@selector(setUpSequence1) afterDelay:0];
//    [self performSetUpSequence:@selector(setUpSequenceUsingIDLE) afterDelay:0];
    [self performSetUpSequence:@selector(setUpSequenceUsingIDLE2) afterDelay:0];
}

- (void)tearDown
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [foo release];
    foo = nil;
    [super tearDown];
}

- (void)dealloc
{
    [foo release];
    [super dealloc];
}


#pragma mark -
#pragma mark Helpers

- (void)setUpSequence1
{
    foo.bar = 1;    
    [self performSetUpSequence:@selector(setUpSequence2) afterDelay:0];
}

- (void)setUpSequence2
{
    foo.bar = 2;
}


- (void)setUpSequenceUsingIDLE
{
    foo.bar = 1;
    SETUP_IDLE(setUp2SequenceUsingIDLE, 0);
    foo.bar = 2;
}

- (void)setUpSequenceUsingIDLE2
{
    foo.bar = 1;
    SETUP_IDLE(setUp2SequenceUsingIDLE2, 0);
    SETUP_IDLE(setUp3SequenceUsingIDLE2, 0);
    foo.bar = 2;
}


#pragma mark -
#pragma mark Tests

- (void)testNotification
{
    ASSERT_EQUAL_INT(2, notifiedCount);
}



#pragma mark -
#pragma mark notification

- (void)fooDidChange:(NSNotification *)notifcation
{
    notifiedCount++;
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
