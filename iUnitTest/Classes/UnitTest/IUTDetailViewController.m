//
//  IUTDetailViewController.m
//  iUnitTest
//
//  Created by Katsuyoshi Ito on 09/01/22.
//  Copyright 2009 ITO SOFT DESIGN Inc. All rights reserved.
//

#import "IUTDetailViewController.h"
#import "IUTAssertion.h"
#import "IUTTestRunner.h"


@implementation IUTDetailViewController

@synthesize textView, exception;

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


- (void)dealloc {
    [exception release];
    [textView release];
    [super dealloc];
}


- (void)setException:(NSException *)anException
{
    if (exception != anException) {
        [exception release];
        exception = [anException retain];

        IUTAssertionInfo *info =[IUTAssertion assertionInfoForException:exception];
        if (info) {
            self.view.backgroundColor = ([exception.name isEqualToString:IUTAssertionExceptionName]) ? [IUTTestRunner failureColor] : [IUTTestRunner errorColor];
            self.textView.text = info.reason;
        } else {
            self.view.backgroundColor = [IUTTestRunner errorColor];
            self.textView.text = exception.reason;
        }
    }
}


@end
