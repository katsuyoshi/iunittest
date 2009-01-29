//
//  PrefecturesAppDelegate.m
//  Prefectures
//
//  Created by Katsuyoshi Ito on 09/01/26.
//  Copyright ITO SOFT DESIGN Inc 2009. All rights reserved.
//

#import "PrefecturesAppDelegate.h"
#import "RootViewController.h"


@implementation PrefecturesAppDelegate

@synthesize window;
@synthesize navigationController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {
	
	// Configure and show the window
	[window addSubview:[navigationController view]];
	[window makeKeyAndVisible];
}


- (void)applicationWillTerminate:(UIApplication *)application {
	// Save data if appropriate
}


- (void)dealloc {
	[navigationController release];
	[window release];
	[super dealloc];
}

@end
