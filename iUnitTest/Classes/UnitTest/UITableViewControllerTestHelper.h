/*
 *  UITableViewControllerTestHelper.h
 *  iUnitTest
 *
 *  Created by Katsuyoshi Ito on 09/09/04.
 *  Copyright 2009 ITO SOFT DESIGN Inc. All rights reserved.
 *
 */


// For UITableViewController

#define CELL(r,s)                       [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:(r) inSection:(s)]]

#define NUMBER_OF_SECTIONS()            [self.tableViewController numberOfSectionsInTableView:self.tableView]

#define NUMBER_OF_ROWS_IN_SECTION(s)	[self.tableViewController tableView:self.tableView numberOfRowsInSection:(s)]

#define CELL_FOR_ROW_IN_SECTION(r,s)    [self.tableViewController tableView:self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:(r) inSection:(s)]];

#define SELECT_CELL(r,s)                [self.tableViewController tableView:self.tableView didSelectRowAtIndexPath:[NSIndexPath indexPathForRow:(r) inSection:(s)]]

#define TITLE_FOR_SECTION(s)            [self.tableViewController tableView:self.tableView titleForHeaderInSection:s]

#define EDITING_STYLE(r,s)              [self.tableViewController tableView:self.tableView editingStyleForRowAtIndexPath:[NSIndexPath indexPathForRow:(r) inSection:(s)]]



// For UITableView

#define TABLEVIEW_CELL(r,s)             [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:(r) inSection:(s)]]
