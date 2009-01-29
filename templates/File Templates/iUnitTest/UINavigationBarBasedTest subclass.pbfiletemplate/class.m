//
//  UINavigationBarBasedTestTest.m
//  iUnitTestTest
//
//  Created by Katsuyoshi Ito on 09/01/17.
//  Copyright 2009 ITO SOFT DESIGN Inc. All rights reserved.
//

#import "UINavigationBarBasedTestTest.h"


@implementation UINavigationBarBasedTestTest


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

- (UIViewController *)rootViewController
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

@end
