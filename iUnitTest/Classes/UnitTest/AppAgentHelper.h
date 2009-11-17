/*
 *  AppAgentHelper.h
 *  irPanelTest
 *
 *  Created by Katsuyoshi Ito on 09/11/17.
 *  Copyright 2009 ITO SOFT DESIGN Inc. All rights reserved.
 *
 */

#import "AppAgent.h"



#pragma mark -
#pragma mark get object

#define AGENT   [AppAgent sharedAppAgent]

#define TABLEVIEW AGENT.tableView
#define VIEWCONTROLLER  AGENT.visibleViewController

#define TABLEVIEW_CELL(r,s) [AGENT.tableViewController tableView:AGENT.tableViewController.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:r inSection:s]]


#define TEXTFIELD_IN_VIEW(v)    [AGENT textFieldInView:v]



#pragma mark -
#pragma mark actions


#define _SEND_ACTION(obj) do {\
    UIBarButtonItem *item = obj;\
    [item.target performSelector:item.action withObject:NULL];\
} while(0);


#define TOUCH_BACK_BAR_BUTTON_ITEM()  _SEND_ACTION(AGENT.visibleViewController.navigationItem.backBarButtonItem)

#define TOUCH_LEFT_BAR_BUTTON_ITEM()  _SEND_ACTION(AGENT.visibleViewController.navigationItem.leftBarButtonItem)

#define TOUCH_RIGHT_BAR_BUTTON_ITEM() _SEND_ACTION(AGENT.visibleViewController.navigationItem.rightBarButtonItem)


#define CLOSE_ALL_ALERTVIEWS()    [AGENT closeAllAlertViews];


