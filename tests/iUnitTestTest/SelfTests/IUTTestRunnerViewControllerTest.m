//
//  IUTTestRunnerViewControllerTest.m
//  iUnitTest
//
//  Created by Katsuyoshi Ito on 09/01/22.
//  Copyright 2009 ITO SOFT DESIGN Inc. All rights reserved.
//

#import "IUTTestRunnerViewControllerTest.h"



@implementation IUTTestRunnerViewControllerTest


- (void)setUp
{
    [super setUp];
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

- (UIViewController *)rootViewController
{
    // this controller will be tested.
    // TODO: replace your view controller
    controller = [[IUTTestRunnerViewController alloc] init];
    return controller;
}



// FIXME: Comparing color method rise an exception. I don't know how to test. 
- (void)_testBackgroundColorWhenSuccesed
{
    [controller didTest:self];
    ASSERT_EQUAL(controller.runner.successColor, controller.view.backgroundColor);
}

@end
