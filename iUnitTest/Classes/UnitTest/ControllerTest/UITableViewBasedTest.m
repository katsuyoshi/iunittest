//
//  UITableViewBasedTest.m
//  iUnitTestTest
//
//  Created by Katsuyoshi Ito on 09/06/19.
//  Copyright 2009 ITO SOFT DESIGN Inc. All rights reserved.
//

#import "UITableViewBasedTest.h"



@implementation UITableViewBasedTest

@synthesize window, tableViewController;

- (void)setUp
{
    [super setUp];
    
    window = [[UIApplication sharedApplication].keyWindow retain];
    tableViewController = [[self tableViewController] retain];
    [window addSubview:tableViewController.view];
    [window bringSubviewToFront:tableViewController.view];
}

- (void)tearDown
{
    [tableViewController.view removeFromSuperview];
    [tableViewController release];
    tableViewController = nil;
    [window release];
    window = nil;
    [super tearDown];
}

// Override to return a view controller that is tested.
- (UITableViewController *)tableViewController
{
    return [[[UITableViewController alloc] initWithStyle:UITableViewStylePlain] autorelease];
}

- (UITableView *)tableView
{
    return tableViewController.tableView;
}

- (void)dealloc
{
    [tableViewController.view removeFromSuperview];
    [tableViewController release];
    [window release];
    [super dealloc];
}


@end
