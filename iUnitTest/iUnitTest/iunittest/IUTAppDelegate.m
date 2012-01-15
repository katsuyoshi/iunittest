//
//  AppDelegate.m
//  iUnitTest
//
//  Created by Katsuyoshi Ito on 09/01/16.
//  Copyright 2009 ITO SOFT DESIGN Inc. All rights reserved.
//

#import "IUTAppDelegate.h"
#import "SourceCodeOpener.h"

@implementation IUTAppDelegate

@synthesize window, viewController;

- (void)applicationDidFinishLaunching:(UIApplication *)application {    

/* FIXME:
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [self setMyAppBoolProperty:[defaults boolForKey:MY_BOOL_PREF_KEY]];
*/

    // Override point for customization after application launch
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
    
    SOURCE_CODE_OPENER_START();
}


- (void)dealloc {
    [viewController.view removeFromSuperview];
    [viewController release];
    [window release];
    [super dealloc];
}

@end
