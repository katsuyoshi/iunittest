//
//  AppDelegate.m
//  iUnitTest
//
//  Created by Katsuyoshi Ito on 09/01/16.
//  Copyright 2009 ITO SOFT DESIGN Inc. All rights reserved.
//

#import "AppDelegate.h"


@implementation AppDelegate

@synthesize window, viewController;

- (void)applicationDidFinishLaunching:(UIApplication *)application {    

    // Override point for customization after application launch
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController.view removeFromSuperview];
    [viewController release];
    [window release];
    [super dealloc];
}

@end
