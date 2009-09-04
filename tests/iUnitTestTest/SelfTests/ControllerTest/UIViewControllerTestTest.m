//
//  UIViewControllerTestTest.m
//  iUnitTestTest
//
//  Created by Katsuyoshi Ito on 09/09/04.
//  Copyright 2009 ITO SOFT DESIGN Inc. All rights reserved.
//

#import "UIViewControllerTestTest.h"
#import "MyViewController.h"
#import "MyViewController2.h"


#pragma mark -
#pragma mark -

@implementation UIViewControllerTestWithNavicationTest

- (void)testViewControllers
{
    ASSERT_SAME(_baseViwController, _viewController);
    ASSERT_SAME(_baseViwController, self.viewController);
    ASSERT_NIL(_tabBarController);
    ASSERT_NIL(_navigationController);
}


@end


#pragma mark -
#pragma mark -

@implementation UIViewControllerTestTest

- (BOOL)hasNavigationController
{
    return YES;
}

#pragma mark -
#pragma mark Tests

- (void)testViewControllers
{
    ASSERT_SAME(_baseViwController, _navigationController);
    
    ASSERT_SAME(_viewController, self.viewController);
    
    ASSERT_NOT_NIL(_navigationController);
    ASSERT_SAME(_navigationController, _viewController.navigationController);
    
    ASSERT_NIL(_tabBarController);
}

@end


#pragma mark -
#pragma mark -

@implementation UIViewControllerTestWithTabBarTest

- (BOOL)hasTabBarController
{
    return YES;
}

#pragma mark -
#pragma mark Tests

- (void)testViewControllers
{
    ASSERT_SAME(_baseViwController, _tabBarController);
    
    ASSERT_SAME(_viewController, self.viewController);
    
    ASSERT_NIL(_navigationController);
    ASSERT_NOT_NIL(_tabBarController);
    
    ASSERT_SAME(_tabBarController, _viewController.tabBarController);
}


@end

#pragma mark -
#pragma mark -

@implementation UIViewControllerTestWithNavicationAndTabBarTest

- (BOOL)hasNavigationController
{
    return YES;
}

- (BOOL)hasTabBarController
{
    return YES;
}

#pragma mark -
#pragma mark Tests

- (void)testViewControllers
{
    ASSERT_SAME(_baseViwController, _tabBarController);
    
    ASSERT_SAME(_viewController, self.viewController);
    
    ASSERT_NOT_NIL(_navigationController);
    ASSERT_SAME(_navigationController, _viewController.navigationController);
    
    ASSERT_NOT_NIL(_tabBarController);
    ASSERT_SAME(_tabBarController, _viewController.tabBarController);
}

@end



#pragma mark -
#pragma mark -

@implementation UIViewControllerTestWithClassNameTest

- (NSString *)viewControllerName
{
    return @"MyViewController";
}

#pragma mark -
#pragma mark Tests

- (void)testViewControllers
{
    ASSERT([_viewController isKindOfClass:[MyViewController class]]);
}

@end

#pragma mark -
#pragma mark -

@implementation UIViewControllerTestWithNibNameTest

- (NSString *)viewControllerName
{
    return nil;
}

- (NSString *)viewControllerNibName
{
    return @"MyViewController2";
}

#pragma mark -
#pragma mark Tests

- (void)testViewControllers
{
    ASSERT([_viewController isKindOfClass:[MyViewController2 class]]);
}

@end

#pragma mark -
#pragma mark -

@implementation UIViewControllerTestWithClassNameAndDifferentNibNameTest

- (NSString *)viewControllerName
{
    return @"MyViewController";
}

- (NSString *)viewControllerNibName
{
    return @"MyViewController2";
}

#pragma mark -
#pragma mark Tests

- (void)testViewControllers
{
    ASSERT([_viewController isKindOfClass:[MyViewController class]]);
}

@end


