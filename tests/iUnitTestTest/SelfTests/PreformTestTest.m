//
//  PreformTestTest.m
//  iUnitTestTest
//
//  Created by Katsuyoshi Ito on 09/02/15.
//  Copyright 2009 ITO SOFT DESIGN Inc. All rights reserved.
//

#import "PreformTestTest.h"



@implementation PreformTestTest

- (void)setUp
{
    [super setUp];
    foo = [Foo new];
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    [notificationCenter addObserver:self selector:@selector(fooDidChange:) name:FooDidChangeNotification object:foo];
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


/*
// It won't be a success.
// Because fooDidChange: is called after testNotification.
// The notifiedCount is zero this moment.
- (void)testNotification
{
    foo.bar = 123;
    foo.hoge = 456;
    
    ASSERT_EQUAL_INT(1, notifiedCount);
}
*/

// It will be a success.
// The fooDidChange: is called after testNotification.
// Then _test2Notification is called.
- (void)testNotification
{
    // The foo will notify, did change property.
    foo.bar = 123;
    foo.hoge = 456;
    
    // It makes to test after notification.
    // You can adjust timing by afterDelay.
    [self performTest:@selector(_test2Notification) afterDelay:0.0];
}

- (void)_test2Notification
{
    ASSERT_EQUAL_INT(1, notifiedCount);
}


- (void)testNotificationUsiingIDLE
{
    // The foo will notify, did change property.
    foo.bar = 123;
    foo.hoge = 456;
    
    TEST_IDLE(test2NotificationUsiingIDLE, 0.0);
    ASSERT_EQUAL_INT(1, notifiedCount);
}

- (void)testNotificationUsiingIDLE2
{
    // The foo will notify, did change property.
    foo.bar = 123;
    foo.hoge = 456;
    
    TEST_IDLE(test2NotificationUsiingIDLE2, 0.0);
    ASSERT(YES);
    TEST_IDLE(test3NotificationUsiingIDLE2, 0.0);
    ASSERT_EQUAL_INT(1, notifiedCount);
}



#pragma mark -
#pragma mark notification

- (void)fooDidChange:(NSNotification *)notifcation
{
    notifiedCount++;
}

@end
