//
//  UINavigationBarBasedTest.m
//  iUnitTest
//
//  Created by Katsuyoshi Ito on 09/01/17.
//  Copyright 2009 ITO SOFT DESIGN Inc. All rights reserved.
//

#import "UINavigationBarBasedTest.h"


@implementation UINavigationBarBasedTest

@synthesize window, navigationController;

- (void)setUp
{
    [super setUp];
    
    window = [[UIApplication sharedApplication].keyWindow retain];
    navigationController = [[UINavigationController alloc] initWithRootViewController:self.rootViewController];
    [window addSubview:navigationController.view];
    [window bringSubviewToFront:navigationController.view];
}

- (void)tearDown
{
    [navigationController.view removeFromSuperview];
    [navigationController release];
    navigationController = nil;
    [window release];
    window = nil;
    [super tearDown];
}

- (UIViewController *)rootViewController
{
    return [[[UITableViewController alloc] initWithStyle:UITableViewStylePlain] autorelease];
}

- (void)dealloc
{
    [navigationController.view removeFromSuperview];
    [navigationController release];
    [window release];
    [super dealloc];
}

@end
