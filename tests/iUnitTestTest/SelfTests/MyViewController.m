//
//  MyViewController.m
//  iUnitTestTest
//
//  Created by Katsuyoshi Ito on 09/09/04.
//  Copyright 2009 ITO SOFT DESIGN Inc. All rights reserved.
//

#import "MyViewController.h"


@implementation MyViewController

@synthesize saved, canceled;


/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
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

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


- (void)setEditing:(BOOL)editing animated:(BOOL)animated {

    if (editing) {
    
        preLeftBarButtonItem = [self.navigationItem.leftBarButtonItem retain];
        
        UIBarButtonItem *saveBarButtonItem = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveAction:)] autorelease];
        UIBarButtonItem *cancelBarButtonItem = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelAction:)] autorelease];
    
        self.navigationItem.leftBarButtonItem = cancelBarButtonItem;
        self.navigationItem.rightBarButtonItem = saveBarButtonItem;
        
    } else {
    
        self.navigationItem.leftBarButtonItem = preLeftBarButtonItem;
        self.navigationItem.rightBarButtonItem = nil;
        
        [preLeftBarButtonItem release];
        preLeftBarButtonItem = nil;
        
    
    }
}


- (void)saveAction:(id)sender
{
    saved = YES;
}

- (void)cancelAction:(id)sender
{
    canceled = YES;
}


@end
