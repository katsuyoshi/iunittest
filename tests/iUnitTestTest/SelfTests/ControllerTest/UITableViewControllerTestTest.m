//
//  UITableViewControllerTestTest.m
//  iUnitTestTest
//
//  Created by Katsuyoshi Ito on 09/09/04.
//  Copyright 2009 ITO SOFT DESIGN Inc. All rights reserved.
//

#import "UITableViewControllerTestTest.h"
#import "MyTableViewController.h"
#import "MyTableViewController2.h"



@implementation UITableViewControllerTestTest

- (NSString *)viewControllerName
{
    return @"MyTableViewController";
}

#pragma mark -
#pragma mark Tests

- (void)test
{
    ASSERT([_viewController isKindOfClass:[MyTableViewController class]]);
    ASSERT_SAME(_viewController, self.tableViewController);
    ASSERT_SAME(((MyTableViewController *)_viewController).tableView, self.tableView);
    ASSERT_EQUAL_INT(UITableViewStylePlain, self.tableView.style);
}

@end

#pragma mark -
#pragma mark -

@implementation UITableViewControllerTestWithStyleTest

- (NSString *)viewControllerName
{
    return @"MyTableViewController";
}

- (UITableViewStyle)tableViewStyle
{
    return UITableViewStyleGrouped;
}

#pragma mark -
#pragma mark Tests

- (void)test
{
    ASSERT([_viewController isKindOfClass:[MyTableViewController class]]);
    ASSERT_SAME(_viewController, self.tableViewController);
    ASSERT_SAME(((MyTableViewController *)_viewController).tableView, self.tableView);
    ASSERT_EQUAL_INT(UITableViewStyleGrouped, self.tableView.style);
}

@end


#pragma mark -
#pragma mark -

@implementation UITableViewControllerTestWithNibTest

- (NSString *)viewControllerName
{
    return nil;
}

- (NSString *)viewControllerNibName
{
    return @"MyTableViewController2";
}

#pragma mark -
#pragma mark Tests

- (void)test
{
    ASSERT([_viewController isKindOfClass:[MyTableViewController2 class]]);
    ASSERT_SAME(_viewController, self.tableViewController);
    ASSERT_SAME(((MyTableViewController *)_viewController).tableView, self.tableView);
}

@end




