//
//  AppAgent.m
//  irPanelTest
//
//  Created by Katsuyoshi Ito on 09/11/17.
//  Copyright 2009 ITO SOFT DESIGN Inc. All rights reserved.
//

#import "AppAgent.h"


@implementation AppAgent

+ (AppAgent *)sharedAppAgent
{
    static id agent = nil;
    if (agent == nil) {
        agent = [self new];
    }
    return agent;
}


- (UIWindow *)window
{
    UIApplication *app = [UIApplication sharedApplication];
    return [app keyWindow];
}


- (UIView *)findViewWithClass:(Class)klass inViews:(NSArray *)views 
{
    NSEnumerator *viewEnumerator = [views reverseObjectEnumerator];
    UIView *view;
    
    while (view = [viewEnumerator nextObject]) {
        if ([view isKindOfClass:klass]) {
            return view;
        }
    }
    viewEnumerator = [views reverseObjectEnumerator];
    while (view = [viewEnumerator nextObject]) {
        UIView *foundView = [self findViewWithClass:klass inViews:[view subviews]];
        if (foundView) {
            return foundView;
        }
    }
    return nil;
}

- (NSArray *)findAllViewWithClass:(Class)klass inViews:(NSArray *)views 
{
    NSMutableArray *result = [NSMutableArray array];
    
    NSEnumerator *viewEnumerator = [views reverseObjectEnumerator];
    UIView *view;
    
    while (view = [viewEnumerator nextObject]) {
        if ([view isKindOfClass:klass]) {
            [result addObject:view];
        }
    }
    viewEnumerator = [views reverseObjectEnumerator];
    while (view = [viewEnumerator nextObject]) {
        [result addObjectsFromArray:[self findAllViewWithClass:klass inViews:[view subviews]]];
    }
    return result;
}

- (UINavigationBar *)findNavigationBarInViews:(NSArray *)views
{
    return (UINavigationBar *)[self findViewWithClass:[UINavigationBar class] inViews:views];
}

- (UINavigationController *)navigationController
{
    UINavigationBar *navigationBar = [self findNavigationBarInViews:[self.window subviews]];
    id delegate = navigationBar.delegate;
    if ([delegate isKindOfClass:[UINavigationController class]]) {
        return delegate;
    }
    return nil;
}

- (UIViewController *)visibleViewController
{
    return [self.navigationController visibleViewController];
}

- (UITableViewController *)tableViewController
{
    UIViewController *controller = self.visibleViewController;
    if ([controller isKindOfClass:[UITableViewController class]]) {
        return (UITableViewController *)self.visibleViewController;
    }
    return nil;
}


- (UITableView *)tableView
{
    UIViewController *conteroller = self.visibleViewController;
    if ([conteroller isKindOfClass:[UITableViewController class]]) {
        return ((UITableViewController *)conteroller).tableView;
    }
    return nil;
}

- (UITextField *)textFieldInView:(UIView *)view
{
    return (UITextField *)[self findViewWithClass:[UITextField class] inViews:[view subviews]];
}


- (BOOL)closeAllAlertViews
{
    NSArray *alertViews = [self findAllViewWithClass:[UIAlertView class] inViews:[self.window subviews]];
    
    for (UIAlertView *alertView in alertViews) {
        [alertView dismissWithClickedButtonIndex:0 animated:NO];
    }
    return [alertViews count];
}

@end
