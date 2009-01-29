//
//  IUTTestRunnerViewController.h
//  iUnitTest
//
//  Created by Katsuyoshi Ito on 09/01/16.
//  Copyright 2009 ITO SOFT DESIGN Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IUTTestRunner.h"
#import "IUTResultTableViewController.h"


@interface IUTTestRunnerViewController : UIViewController {

    IBOutlet UIProgressView *progressView;
    IBOutlet UIButton *startStopButton;
    IBOutlet UIActivityIndicatorView *indicatorView;
    IBOutlet UILabel *resultLabel;
    IBOutlet IUTResultTableViewController *resultTestViewController;

    BOOL running;

    IUTTestRunner *runner;

}

@property (retain) IBOutlet UIProgressView *progressView;
@property (retain) IBOutlet UIButton *startStopButton;
@property (retain) IBOutlet UIActivityIndicatorView *indicatorView;
@property (retain) IBOutlet UILabel *resultLabel;
@property (retain) IBOutlet IUTResultTableViewController *resultTestViewController;


@property (getter=isRunning) BOOL running;

@property (retain, readonly) IUTTestRunner *runner;
    


- (IBAction)startStopAction:(id)sender;
- (IBAction)startAction:(id)sender;
- (IBAction)stopAction:(id)sender;


- (void)setButtonTitle:(NSString *)title;

- (void)setProgress:(NSNumber *)value;
- (void)willTest:(id)sender;
- (void)didTest:(id)sender;

@end
