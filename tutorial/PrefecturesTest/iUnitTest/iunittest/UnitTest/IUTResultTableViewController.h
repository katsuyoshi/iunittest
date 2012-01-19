//
//  IUTResultTableViewController.h
//  iUnitTest
//
//  Created by Katsuyoshi Ito on 09/01/17.
//  Copyright 2009 ITO SOFT DESIGN Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IUTTestRunner.h"
#import "IUTDetailViewController.h"


@interface IUTResultTableViewController : UITableViewController {
    IUTTestRunner *runner;
    
    IUTDetailViewController *detailViewController;
    UINavigationController *navigationController;
}

@property (retain) IUTTestRunner *runner;
@property (retain, readonly) IUTDetailViewController *detailViewController;

@property (retain) UINavigationController *navigationController;

@end
