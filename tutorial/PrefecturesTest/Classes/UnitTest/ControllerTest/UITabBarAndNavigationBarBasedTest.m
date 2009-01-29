//
//  UITabBarAndNavigationBarBasedTest.m
//  iUnitTest
//
//  Created by Katsuyoshi Ito on 09/01/17.
//  Copyright 2009 ITO SOFT DESIGN Inc. All rights reserved.
//

#import "UITabBarAndNavigationBarBasedTest.h"


@implementation UITabBarAndNavigationBarBasedTest

@synthesize navigationController;

- (void)tearDown
{
    [navigationController.view removeFromSuperview];
    [navigationController release];
    navigationController = nil;
    [super tearDown];
}

- (NSArray *)viewControllers
{
    return [NSArray arrayWithObject:[[[UINavigationController alloc] initWithRootViewController:self.rootViewController] autorelease]];
}


- (UIViewController *)rootViewController
{
    return [[[UITableViewController alloc] initWithStyle:UITableViewStylePlain] autorelease];
}

- (void)dealloc
{
    [navigationController.view removeFromSuperview];
    [navigationController release];
    [super dealloc];
}

@end
