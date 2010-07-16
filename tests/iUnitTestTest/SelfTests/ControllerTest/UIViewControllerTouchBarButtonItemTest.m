//
//  UIViewControllerTouchBarButtonItemTest.m
//  iUnitTestTest
//
//  Created by Katsuyoshi Ito on 09/09/06.
//  Copyright 2009 ITO SOFT DESIGN Inc. All rights reserved.
//

#import "UIViewControllerTouchBarButtonItemTest.h"



@implementation UIViewControllerTouchBarButtonItemTest


#pragma mark -
#pragma mark Helpers


#pragma mark -
#pragma mark about your view controller class

- (NSString *)viewControllerName
{
    return @"MyViewController";
}
- (BOOL)hasNavigationController
{
    return YES;
}

#pragma mark -
#pragma mark setUp/tearDown

- (void)setUp
{
    [super setUp];
}

- (void)tearDown
{
    [nestedViewController release];
    [super tearDown];
}

#pragma mark -
#pragma mark Tests


- (void)testTouchLeftBarButtonItemWithNoAction
{
    nestedViewController = [MyViewController new];
    [self.viewController.navigationController pushViewController:nestedViewController animated:NO];
    
    [self performTest:@selector(_test2TouchLeftBarButtonItemWithNoAction) afterDelay:0.0];
}

- (void)_test2TouchLeftBarButtonItemWithNoAction
{
    ASSERT_SAME(nestedViewController, self.viewController.navigationController.visibleViewController);

    [self touchLeftBarButtonItem];
    ASSERT_SAME(self.viewController, self.viewController.navigationController.visibleViewController);
}

#pragma mark -

- (void)testTouchLeftBarButtonItemWithAction
{
    nestedViewController = [MyViewController new];
    [self.viewController.navigationController pushViewController:nestedViewController animated:NO];
    
    [self performTest:@selector(_test2TouchLeftBarButtonItemWithAction) afterDelay:0.0];
}

- (void)_test2TouchLeftBarButtonItemWithAction
{
    ASSERT_SAME(nestedViewController, self.viewController.navigationController.visibleViewController);
    nestedViewController.editing = YES;

    [self performTest:@selector(_test3TouchLeftBarButtonItemWithAction) afterDelay:0.0];
}

- (void)_test3TouchLeftBarButtonItemWithAction
{
    [self touchLeftBarButtonItem];
    ASSERT_SAME(nestedViewController, self.viewController.navigationController.visibleViewController);
    ASSERT(nestedViewController.canceled);
}

#pragma mark -

- (void)testTouchRightBarButtonItemWithAction
{
    nestedViewController = [MyViewController new];
    [self.viewController.navigationController pushViewController:nestedViewController animated:NO];
    
    [self performTest:@selector(_test2TouchRightBarButtonItemWithAction) afterDelay:0.0];
}

- (void)_test2TouchRightBarButtonItemWithAction
{
    ASSERT_SAME(nestedViewController, self.viewController.navigationController.visibleViewController);
    nestedViewController.editing = YES;

    [self performTest:@selector(_test3TouchRightBarButtonItemWithAction) afterDelay:0.0];
}

- (void)_test3TouchRightBarButtonItemWithAction
{
    [self touchRightBarButtonItem];
    ASSERT_SAME(nestedViewController, self.viewController.navigationController.visibleViewController);
    ASSERT(nestedViewController.saved);
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
