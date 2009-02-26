//
//  IUTTestRunnerViewController.m
//  iUnitTest
//
//  Created by Katsuyoshi Ito on 09/01/16.
//  Copyright 2009 ITO SOFT DESIGN Inc. All rights reserved.
//

#import "IUTTestRunnerViewController.h"
#import "IUTTestRunner.h"
#import "IUTPreference.h"


@interface IUTTestRunnerViewController(_private)
- (void)updateControls;
@end

@implementation IUTTestRunnerViewController

@synthesize progressView, startStopButton, indicatorView, resultLabel, resultTestViewController, allButton;
@synthesize running, runner;


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

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
    
    runner = [IUTTestRunner new];
    
    indicatorView.hidesWhenStopped = YES;
    [self updateControls];
    [progressView setProgress:0.0];

    resultTestViewController = [[IUTResultTableViewController alloc] initWithStyle:UITableViewStylePlain];
    resultTestViewController.view.frame = CGRectMake(0, 50, 320, 410 - 42);
    resultTestViewController.view.backgroundColor = [UIColor clearColor];
    resultTestViewController.navigationController = self.navigationController;
    resultTestViewController.runner = self.runner;
    [self.view addSubview:resultTestViewController.view];
    [[UIApplication sharedApplication].keyWindow bringSubviewToFront:resultTestViewController.view];
    [resultTestViewController.tableView reloadData];
        
    if ([[IUTPreference sharedPreference]isAutoRun]) {
        [self startAction:self];
    }
}

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
    [resultTestViewController release];
    [progressView release];
    [startStopButton release];
    [indicatorView release];
    [resultLabel release];
    [allButton release];
    [runner release];
    [super dealloc];
}


- (void)updateControls
{
    if (self.isRunning) {
        [self setButtonTitle:@"Stop"];
        [progressView setProgress:0.0];
        [indicatorView startAnimating];
        [resultLabel setText:@""];
    } else {
        [self setButtonTitle:@"Start"];
        [indicatorView stopAnimating];
        [resultLabel setText:runner.result];
    }
    [resultTestViewController.tableView reloadData];
    self.view.backgroundColor = runner.backgroundColor;

    allButton.enabled = !self.isRunning && [[IUTPreference sharedPreference] canClear];
}

- (IBAction)startStopAction:(id)sender
{
    if (self.isRunning) {
        [self stopAction:(id)sender];
    } else {
        [self startAction:(id)sender];
    }
}


- (IBAction)startAction:(id)sender
{
    self.running = YES;
    [NSThread detachNewThreadSelector:@selector(run:) toTarget:self.runner withObject:self];
}

- (IBAction)stopAction:(id)sender
{
    self.running = NO;
    [self.runner stop:self];    
}

- (IBAction)clearPassedTestsAction:(id)sender
{
    [[IUTPreference sharedPreference] clearPassedTests];
    [self updateControls];
}


- (void)setButtonTitle:(NSString *)title
{
    [startStopButton setTitle:title forState:UIControlStateNormal];
    [startStopButton setTitle:title forState:UIControlStateHighlighted];
    [startStopButton setTitle:title forState:UIControlStateDisabled];
}

- (void)setProgress:(NSNumber *)value
{
    [progressView setProgress:[value floatValue]];
}

- (void)willTest:(id)sender
{
    [self updateControls];
}

- (void)didTest:(id)sender
{
    [self stopAction:self];
    [self updateControls];
}


@end
