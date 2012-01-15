//
//  UITableViewControllerTest.m
//  iUnitTestTest
//
//  Created by Katsuyoshi Ito on 09/09/04.
//  Copyright 2009 ITO SOFT DESIGN Inc. All rights reserved.
//

#import "UITableViewControllerTest.h"



@implementation UITableViewControllerTest

- (UIViewController *)createViewController
{
    NSString *nibName = [self viewControllerNibName];
    if (nibName == nil) {

        Class class = NSClassFromString([self viewControllerName]);
        return [[[class alloc] initWithStyle:[self tableViewStyle]] autorelease];

    } else {
        return [super createViewController];
    }
}

- (UITableViewStyle)tableViewStyle
{
    return UITableViewStylePlain;
}

- (UITableViewController *)tableViewController
{
    return (UITableViewController *)self.viewController;
}

- (UITableView *)tableView
{
    return self.tableViewController.tableView;
}


@end
