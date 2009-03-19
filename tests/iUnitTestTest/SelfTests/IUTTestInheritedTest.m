//
//  IUTTestInheritedTest.m
//  iUnitTestTest
//
//  Created by Katsuyoshi Ito on 09/03/19.
//  Copyright 2009 ITO SOFT DESIGN Inc. All rights reserved.
//

#import "IUTTestInheritedTest.h"



@implementation IUTTestInheritedTest

+ (BOOL)doesCollectTestsInSuper
{
    return YES;
}

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

- (void)testCollectTests
{
    ASSERT_EQUAL_INT(11, [self.tests count]);
    
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
    ASSERT([self.tests containsObject:@"testInSubclass"]);
}

- (void)testInSubclass
{
}


@end
