//
//  FooTest.m
//  iUnitTestTest
//
//  Created by Katsuyoshi Ito on 09/02/15.
//  Copyright 2009 ITO SOFT DESIGN Inc. All rights reserved.
//

#import "FooTest.h"



@implementation FooTest

- (void)setUp
{
    [super setUp];
    foo = [Foo new];
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    [notificationCenter addObserver:self selector:@selector(fooDidChange:) name:FooDidChangeNotification object:nil];
    notifiedCount = 0;
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


#pragma mark -
#pragma mark Tests

- (void)_testNotification
{
    foo.bar = 123;
    foo.hoge = 456;
    
    ASSERT_EQUAL_INT(2, notifiedCount);
}

- (void)testNotification
{
    foo.bar = 123;
    foo.hoge = 456;
    
    [self performTest:@selector(_test2Notification) afterDelay:0.0];
}

- (void)_test2Notification
{
    ASSERT_EQUAL_INT(1, notifiedCount);
}


#pragma mark -
#pragma mark notification

- (void)fooDidChange:(NSNotification *)notifcation
{
    notifiedCount++;
}

@end
