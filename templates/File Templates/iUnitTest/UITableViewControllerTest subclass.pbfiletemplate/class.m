//
//  UITableViewControllerTestTest.m
//  iUnitTestTest
//
//  Created by Katsuyoshi Ito on 09/09/04.
//  Copyright 2009 ITO SOFT DESIGN Inc. All rights reserved.
//

#import "UITableViewControllerTestTest.h"


@implementation UITableViewControllerTestTest


#pragma mark -
#pragma mark Helpers


#pragma mark -
#pragma mark about your view controller class

/*
- (NSString *)viewControllerName
{
    // TODO: replace your table view controller's name
    return nil;
}
*/
/*
- (NSString *)viewControllerNibName
{
    // TODO: replace your nib file name.
    return nil;
}
*/

/*
- (UITableViewStyle)tableViewStyle
{
    return UITableViewStyleGrouped;
}
*/
/*
- (BOOL)hasNavigationController
{
    return YES;
}
*/
/*
- (BOOL)hasTabBarController
{
    return YES;
}
*/

#pragma mark -
#pragma mark setUp/tearDown

- (void)setUp
{
    [super setUp];
}

- (void)tearDown
{
    [super tearDown];
}

#pragma mark -
#pragma mark Tests


- (void)test1
{
    ASSERT_FAIL(@"not implemented");
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
