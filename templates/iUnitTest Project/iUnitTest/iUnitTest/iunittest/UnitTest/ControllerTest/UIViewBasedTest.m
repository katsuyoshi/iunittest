//
//  UIViewBasedTest.m
//  iUnitTest
//
//  Created by Katsuyoshi Ito on 09/06/19.
//  Copyright 2009 ITO SOFT DESIGN Inc. All rights reserved.
//

#import "UIViewBasedTest.h"



@implementation UIViewBasedTest

@synthesize window, viewController;

- (void)setUp
{
    [super setUp];
    
    window = [[UIApplication sharedApplication].keyWindow retain];
    viewController = [[self viewController] retain];
    [window addSubview:viewController.view];
    [window bringSubviewToFront:viewController.view];
}

- (void)tearDown
{
    [viewController.view removeFromSuperview];
    [viewController release];
    viewController = nil;
    [window release];
    window = nil;
    [super tearDown];
}

// Override to return a view controller that is tested.
- (UIViewController *)viewController
{
    return [[UIViewController new] autorelease];
}

- (void)dealloc
{
    [viewController.view removeFromSuperview];
    [viewController release];
    [window release];
    [super dealloc];
}


@end
