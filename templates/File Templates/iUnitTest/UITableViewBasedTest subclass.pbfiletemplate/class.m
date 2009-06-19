//
//  UITableViewBasedTestTest.m
//  iUnitTestTest
//
//  Created by Katsuyoshi Ito on 09/06/19.
//  Copyright 2009 ITO SOFT DESIGN Inc. All rights reserved.
//

#import "UITableViewBasedTestTest.h"


@implementation UITableViewBasedTestTest


- (void)setUp
{
    [super setUp];
}

- (void)tearDown
{
    [controller release];
    controller = nil;
    [super tearDown];
}

- (void)dealloc
{
    [controller release];
    [super dealloc];
}

- (UITableViewController *)tableViewController
{
    // this controller will be tested.
    // TODO: replace your view controller
    controller = [[UITableViewController alloc] initWithStyle:UITableViewStylePlain];
    return controller;
}


#pragma mark -
#pragma mark Helpers


#pragma mark -
#pragma mark Tests


- (void)test1
{
    ASSERT_FAIL(@"not implemented");
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
