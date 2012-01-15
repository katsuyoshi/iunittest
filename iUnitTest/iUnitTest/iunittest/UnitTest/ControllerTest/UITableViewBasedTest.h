//
//  UITableViewBasedTest.h
//  iUnitTestTest
//
//  Created by Katsuyoshi Ito on 09/06/19.
//  Copyright 2009 ITO SOFT DESIGN Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IUTTest.h"


@interface UITableViewBasedTest : IUTTest {
    UIWindow *window;
    UITableViewController *tableViewController;
}

@property (retain, readonly) UIWindow *window;
@property (retain, readonly) UITableViewController *tableViewController;

@property (assign, readonly) UITableView *tableView;

@end
