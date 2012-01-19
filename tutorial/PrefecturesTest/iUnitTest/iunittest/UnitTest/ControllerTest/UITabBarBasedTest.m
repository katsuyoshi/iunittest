//
//  UITabBarBasedTest.m
//  iUnitTest
//
//  Created by Katsuyoshi Ito on 09/01/17.
//  Copyright 2009 ITO SOFT DESIGN Inc. All rights reserved.
//

#import "UITabBarBasedTest.h"


@implementation UITabBarBasedTest

@synthesize window, tabBarController;

- (void)setUp
{
    [super setUp];
    
    window = [[UIApplication sharedApplication].keyWindow retain];
    tabBarController = [UITabBarController new];
    tabBarController.viewControllers = [self viewControllers];
    [window addSubview:tabBarController.view];
    [window bringSubviewToFront:tabBarController.view];
}

- (void)tearDown
{
    [tabBarController.view removeFromSuperview];
    [tabBarController release];
    tabBarController = nil;
    [window release];
    window = nil;
    [super tearDown];
}

- (NSArray *)viewControllers
{
    return [NSArray arrayWithObject:[[[UITableViewController alloc] initWithStyle:UITableViewStylePlain] autorelease]];
}

- (void)dealloc
{
    [tabBarController.view removeFromSuperview];
    [tabBarController release];
    [window release];
    [super dealloc];
}

@end
