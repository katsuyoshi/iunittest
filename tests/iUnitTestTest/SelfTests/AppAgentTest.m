//
//  AppAgentTest.m
//  irPanelTest
//
//  Created by Katsuyoshi Ito on 09/11/17.
//  Copyright 2009 ITO SOFT DESIGN Inc. All rights reserved.
//

#import "AppAgentTest.h"



@implementation AppAgentTest

- (void)setUp
{
    [super setUp];
    agent = [[AppAgent sharedAppAgent] retain];
}

- (void)tearDown
{
    [agent release];
    [textField removeFromSuperview];
    textField = nil;
    [super tearDown];
}

- (void)dealloc
{
    [super dealloc];
}

- (BOOL)hasNavigationController
{
    return YES;
}


#pragma mark -
#pragma mark Helpers

- (NSString *)viewControllerName
{
    return @"UITableViewController";
}

#pragma mark -
#pragma mark Tests

- (void)testWindow
{
    ASSERT_NOT_NIL(agent.window);
}

- (void)testNavigationController
{
    ASSERT_NOT_NIL(agent.navigationController);
}

- (void)testVisibleViewController
{
    ASSERT_NOT_NIL(agent.visibleViewController);
}

- (void)testTableViewController
{
    ASSERT_NOT_NIL(agent.tableViewController);
}

- (void)testTableView
{
    ASSERT_NOT_NIL(agent.tableView);
}

- (void)testTextFieldInView
{
    ASSERT_NIL([agent textFieldInView:agent.tableView]);
    
    textField = [[UITextField alloc] initWithFrame:CGRectZero];
    [agent.tableView addSubview:textField];
    
    ASSERT_NOT_NIL([agent textFieldInView:agent.tableView]);
}

- (void)testCloseAllAlertViews
{
    ASSERT(![agent closeAllAlertViews]);
    
    UIAlertView *alertView = [[[UIAlertView alloc] initWithTitle:@"" message:@"" delegate:nil cancelButtonTitle:@"" otherButtonTitles:nil] autorelease];
    [alertView show];
    
    ASSERT([agent closeAllAlertViews]);
}


#pragma mark -
#pragma mark Option

// Uncomment it, if you want to test this class except other passed test classes.
//#define TESTS_ALWAYS
#ifdef TESTS_ALWAYS
- (void)testThisClassAlways { ASSERT_FAIL(@"fail always"); }
+ (BOOL)forceTestsAnyway { return YES; }
#endif

@end
