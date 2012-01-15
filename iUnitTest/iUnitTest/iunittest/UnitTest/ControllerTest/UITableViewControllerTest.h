//
//  UITableViewControllerTest.h
//  iUnitTestTest
//
//  Created by Katsuyoshi Ito on 09/09/04.
//  Copyright 2009 ITO SOFT DESIGN Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIViewControllerTest.h"


@interface UITableViewControllerTest : UIViewControllerTest {

}

- (UITableViewStyle)tableViewStyle;

@property (assign, readonly) UITableViewController *tableViewController;
@property (assign, readonly) UITableView *tableView;

@end
