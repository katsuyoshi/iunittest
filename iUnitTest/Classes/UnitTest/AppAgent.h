//
//  AppAgent.h
//  irPanelTest
//
//  Created by Katsuyoshi Ito on 09/11/17.
//  Copyright 2009 ITO SOFT DESIGN Inc. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface AppAgent : NSObject {

}

+ (AppAgent *)sharedAppAgent;

@property (assign, readonly) UIWindow *window;
@property (assign, readonly) UINavigationController *navigationController;

@property (assign, readonly) UIViewController *visibleViewController;
@property (assign, readonly) UITableViewController *tableViewController;

@property (assign, readonly) UITableView *tableView;


- (UITextField *)textFieldInView:(UIView *)view;

- (BOOL)closeAllAlertViews;

@end
