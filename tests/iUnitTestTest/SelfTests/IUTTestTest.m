//
//  IUTTestTest.m
//  iUnitTest
//
//  Created by Katsuyoshi Ito on 09/01/17.
//  Copyright 2009 ITO SOFT DESIGN Inc. All rights reserved.
//

#import "IUTTestTest.h"


@implementation IUTTestTest

- (void)testCollectTests
{
    ASSERT_EQUAL_INT(10, [self.tests count]);
    
    ASSERT([self.tests containsObject:@"testCollectTests"]);
    ASSERT([self.tests containsObject:@"test1"]);
    ASSERT([self.tests containsObject:@"test2"]);
    ASSERT([self.tests containsObject:@"test3"]);
    ASSERT([self.tests containsObject:@"test4"]);
    ASSERT([self.tests containsObject:@"test5"]);
    ASSERT([self.tests containsObject:@"test6"]);
    ASSERT([self.tests containsObject:@"test7"]);
    ASSERT([self.tests containsObject:@"test8"]);
    ASSERT([self.tests containsObject:@"test9"]);
}

// collect start with test methods only
- (void)test1 {}
- (void)test2 {}
- (void)test3 {}
- (void)test4 {}
- (void)test5 {}
- (void)test6 {}
- (void)test7 {}
- (void)test8 {}
- (void)test9 {}

// those tests are not collected
- (void)_test1 {}
- (void)abcTest {}


#if 0
// for checking.
// if you want to check how it display on table view, uncomment it
- (void)testError
{
    [[NSArray array] objectAtIndex:1];
}

- (void)testAssertRaise
{
    ASSERT_RAISE(NSLog(@"exception"));
}

- (void)testAssertNothingRaised
{
    ASSERT_NOTHING_RAISED(@throw @"exception");
}

+ (BOOL)forceTestsAnyway
{
    return YES;
}

#endif

@end
