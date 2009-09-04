//
//  UIViewControllerTest.m
//  iUnitTest
//
//  Created by Katsuyoshi Ito on 09/09/04.
//  Copyright 2009 ITO SOFT DESIGN Inc. All rights reserved.
//

#import "UIViewControllerTest.h"


@implementation UIViewControllerTest

@synthesize viewController = _viewController;

#pragma mark -
#pragma mark Helpers

- (UIViewController *)createViewController
{
    NSString *nibName = [self viewControllerNibName];
    NSString *className = [self viewControllerName];
    if (nibName && className == nil) {
        className = nibName;
    }
    
    Class class = NSClassFromString(className);
    if (nibName) {
        return [[[class alloc] initWithNibName:nibName bundle:nil] autorelease];
    } else {
        return [[class new] autorelease];
    }
}

- (void)buildViewController
{
    _viewController = [[self createViewController] retain];
    _baseViwController = _viewController;
    
    if ([self hasNavigationController]) {
        _navigationController = [[UINavigationController alloc] initWithRootViewController:_viewController];
        _baseViwController = _navigationController;
    }
    
    if ([self hasTabBarController]) {
        _tabBarController = [UITabBarController new];
        _tabBarController.viewControllers = [NSArray arrayWithObject:_baseViwController];
        _baseViwController = _tabBarController;
    }
    
    [_baseViwController retain];

    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:_baseViwController.view];
    [window bringSubviewToFront:_baseViwController.view];
}

#pragma mark -
#pragma mark setUp/tearDown


- (void)setUp
{
    [super setUp];
    [self buildViewController];
}

- (void)tearDown
{
    // close modal views
    NSMutableArray *modalViewControllers = [NSMutableArray array];
    UIViewController *modalViewController = [_baseViwController modalViewController];
    while (modalViewController) {
        [modalViewControllers insertObject:modalViewController atIndex:0];
        modalViewController = [modalViewController modalViewController];
    }
    for (UIViewController *controller in modalViewControllers) {
        [controller dismissModalViewControllerAnimated:NO];
    }
    
    [_baseViwController.view removeFromSuperview];
    
    [_baseViwController release];
    _baseViwController = nil;
    [_tabBarController release];
    _tabBarController = nil;
    [_navigationController release];
    _navigationController = nil;
    [_viewController release];
    _viewController = nil;

    [super tearDown];
}

#pragma mark -

- (NSString *)viewControllerNibName
{
    return nil;
}

- (NSString *)viewControllerName
{
    return @"UIViewController";
}

- (BOOL)hasNavigationController
{
    return NO;
}

- (BOOL)hasTabBarController
{
    return NO;
}

@end
