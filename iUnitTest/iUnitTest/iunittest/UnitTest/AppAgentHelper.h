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

#define TABLEVIEW               AGENT.tableView
#define VIEWCONTROLLER          AGENT.visibleViewController
#define TABLEVIEWCONTROLLER     AGENT.tableViewController

#define TABLEVIEW_CELL(r,s) [AGENT.tableViewController tableView:AGENT.tableViewController.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:r inSection:s]]


#define TEXTFIELD_IN_VIEW(v)    [AGENT textFieldInView:v]
#define SWITCH_IN_VIEW(v)       [AGENT switchInView:v]


#define ALERTVIEWS              AGENT.alertViews



#pragma mark -
#pragma mark actions


#define _SEND_ACTION(obj) do {\
    UIBarButtonItem *item = obj;\
    [item.target performSelector:item.action withObject:NULL];\
} while(0)


#define TOUCH_BACK_BAR_BUTTON_ITEM()    _SEND_ACTION(AGENT.visibleViewController.navigationItem.backBarButtonItem)

#define TOUCH_LEFT_BAR_BUTTON_ITEM()    _SEND_ACTION(AGENT.visibleViewController.navigationItem.leftBarButtonItem)

#define TOUCH_RIGHT_BAR_BUTTON_ITEM()   _SEND_ACTION(AGENT.visibleViewController.navigationItem.rightBarButtonItem)


#define TOUCH_CELL(r,s) do{\
    UITableViewController *controller = TABLEVIEWCONTROLLER;\
    [controller tableView:controller.tableView didSelectRowAtIndexPath:[NSIndexPath indexPathForRow:r inSection:s]];\
} while(0)

#define TOUCH_ACCESSORY_BUTTON_OF_CELL(r,s) do{\
    UITableViewController *controller = TABLEVIEWCONTROLLER;\
    [controller tableView:controller.tableView accessoryButtonTappedForRowWithIndexPath:[NSIndexPath indexPathForRow:r inSection:s]];\
} while(0)

#define CLOSE_ALL_ALERTVIEWS()  [AGENT closeAllAlertViews]


