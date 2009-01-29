//
//  RootViewControllerTest.m
//  PrefecturesTest
//
//  Created by Katsuyoshi Ito on 09/01/26.
//  Copyright 2009 ITO SOFT DESIGN Inc. All rights reserved.
//

#import "RootViewControllerTest.h"



@implementation RootViewControllerTest


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
    controller = [[RootViewController alloc] initWithStyle:UITableViewStylePlain];
    return controller;
}


#pragma mark -
#pragma mark Helpers


#pragma mark -
#pragma mark Tests


- (void)testNumberOfSectionsInTableView
{
    ASSERT_EQUAL_INT(2, [controller numberOfSectionsInTableView:controller.tableView]);
}

- (void)testTitleForHeaderInSection
{
    ASSERT_EQUAL(@"Hokkaido", [controller tableView:controller.tableView titleForHeaderInSection:0]);
    ASSERT_EQUAL(@"Tohoku", [controller tableView:controller.tableView titleForHeaderInSection:1]);
}

- (void)testNumberOfRowsInSection
{
    ASSERT_EQUAL_INT(1, [controller tableView:controller.tableView numberOfRowsInSection:0]);
    ASSERT_EQUAL_INT(6, [controller tableView:controller.tableView numberOfRowsInSection:1]);
}

- (void)testCellForRowAtIndexPath
{
    ASSERT_EQUAL(@"Hokkaido", [[controller tableView:controller.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]] text]);
    ASSERT_EQUAL(@"Aomori", [[controller tableView:controller.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:1]] text]);
    ASSERT_EQUAL(@"Iwate", [[controller tableView:controller.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:1]] text]);
    ASSERT_EQUAL(@"Akita", [[controller tableView:controller.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:2 inSection:1]] text]);
    ASSERT_EQUAL(@"Yamagata", [[controller tableView:controller.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:3 inSection:1]] text]);
    ASSERT_EQUAL(@"Miyagi", [[controller tableView:controller.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:4 inSection:1]] text]);
    ASSERT_EQUAL(@"Fukusima", [[controller tableView:controller.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:5 inSection:1]] text]);
}

@end
