//
//  UITabBarBasedTestTest.m
//  iUnitTestTest
//
//  Created by Katsuyoshi Ito on 09/01/17.
//  Copyright 2009 ITO SOFT DESIGN Inc. All rights reserved.
//

#import "UITabBarBasedTestTest.h"


@implementation UITabBarBasedTestTest

- (void)setUp
{
    [super setUp];
}

- (void)tearDown
{
    [controller.view removeFromSuperview];
    [controller release];
    controller = nil;
    [super tearDown];
}

- (void)dealloc
{
    [controller.view removeFromSuperview];
    [controller release];
    [super dealloc];
}

- (NSArray *)viewControllers
{
    // this controller will be tested.
    // TODO: replace your view controller
    controller = [[UITableViewController alloc] initWithStyle:UITableViewStylePlain];
    return [NSArray arrayWithObject:controller];
}


#pragma mark -
#pragma mark Helpers


#pragma mark -
#pragma mark Tests

- (void)test1
{
    ASSERT_FAIL(@"not implemented");
}

@end
