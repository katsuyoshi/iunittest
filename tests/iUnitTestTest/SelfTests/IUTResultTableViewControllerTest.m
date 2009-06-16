//
//  IUTResultTableView.m
//  iUnitTest
//
//  Created by Katsuyoshi Ito on 09/01/17.
//  Copyright 2009 ITO SOFT DESIGN Inc. All rights reserved.
//

#import "IUTResultTableViewControllerTest.h"
#import "IUTTestRunnerMock.h"
#import "IUTResultTableViewCell.h"
#import "NSExceptionExtension.h"



@implementation IUTResultTableViewControllerTest

- (void)setUp
{
    [super setUp];
    controller = [[IUTResultTableViewController alloc] initWithStyle:UITableViewStylePlain];
    controller.runner = [[IUTTestRunnerMock new] autorelease];
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:controller.view];
    [window bringSubviewToFront:controller.view];
    [controller.tableView reloadData];
    testAfterDelay = 0.01;
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


- (UITableView *)tableView
{
    return controller.tableView;
}

- (void)testNumberOfSectionsInTableView
{
    ASSERT_EQUAL_INT(2, [controller numberOfSectionsInTableView:self.tableView]);
}

- (void)testNumberOfRowsInSection
{
    ASSERT_EQUAL_INT(3, [controller tableView:self.tableView numberOfRowsInSection:0]);
    ASSERT_EQUAL_INT(2, [controller tableView:self.tableView numberOfRowsInSection:1]);
}

- (void)testTitleForHeaderInSection
{
    ASSERT_EQUAL(@"3 failures", [controller tableView:self.tableView titleForHeaderInSection:0]);
    ASSERT_EQUAL(@"2 errors", [controller tableView:self.tableView titleForHeaderInSection:1]);
}

- (void)testTitleForHeaderInSectionWithZeroOrOneObject
{
    [controller.runner.fails removeAllObjects];
    [controller.runner.errors removeAllObjects];
    ASSERT_EQUAL(@"0 failure", [controller tableView:self.tableView titleForHeaderInSection:0]);
    ASSERT_EQUAL(@"0 error", [controller tableView:self.tableView titleForHeaderInSection:1]);
    
    // titleForHeaderInSection just minds abount count, puts a string instead.
    [controller.runner.fails addObject:@"abc"];
    [controller.runner.errors addObject:@"abc"];
    ASSERT_EQUAL(@"1 failure", [controller tableView:self.tableView titleForHeaderInSection:0]);
    ASSERT_EQUAL(@"1 error", [controller tableView:self.tableView titleForHeaderInSection:1]);
}

- (void)testCellForRowAtIndexPath
{
    int section, row;
    NSArray *results;
    
    section = 0;
    results = controller.runner.fails;
    for (row = 0; row < [results count]; row++) {
        IUTResultTableViewCell *cell = (IUTResultTableViewCell *)[controller tableView:self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:row inSection:section]];
        NSException *exception = [results objectAtIndex:row];
        ASSERT_EQUAL([exception.assertionInfo reason], cell.resultLabel.text);
        ASSERT_EQUAL_INT(UITableViewCellAccessoryDetailDisclosureButton, cell.accessoryType);
    }

    section = 1;
    results = controller.runner.errors;
    for (row = 0; row < [results count]; row++) {
        IUTResultTableViewCell *cell = (IUTResultTableViewCell *)[controller tableView:self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:row inSection:section]];
        NSException *exception = [results objectAtIndex:row];
        ASSERT_EQUAL([exception reason], cell.resultLabel.text);
        ASSERT_EQUAL_INT(UITableViewCellAccessoryDetailDisclosureButton, cell.accessoryType);
    }

}

- (void)testCellSelectionStyle
{
    UITableViewCell *cell;
    
    cell = [controller tableView:self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    ASSERT_EQUAL_INT(UITableViewCellSelectionStyleBlue, cell.selectionStyle);
    cell = [controller tableView:self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:1]];
    ASSERT_EQUAL_INT(UITableViewCellSelectionStyleBlue, cell.selectionStyle);
}


@end
