//
//  UIViewControllerTest.h
//  iUnitTest
//
//  Created by Katsuyoshi Ito on 09/09/04.
//  Copyright 2009 ITO SOFT DESIGN Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IUTTest.h"


@interface UIViewControllerTest : IUTTest {

    UIViewController *_baseViwController;

    UITabBarController *_tabBarController;
    UINavigationController *_navigationController;
    UIViewController *_viewController;
    
}

@property (retain, readonly) UIViewController *viewController;


/* Create a view controller which is tested. */
- (UIViewController *)createViewController;


/**
 * Return a nib file's name for your view controller.
 * You don't need a nib file, return nil.
 */
- (NSString *)viewControllerNibName;

/**
 * Return your view controller's class name.
 * If nil, use -viewControllerNibName.
 */
- (NSString *)viewControllerName;

/**
 * Return YES if needs navication controller.
 * Default is NO.
 */
- (BOOL)hasNavigationController;

/**
 * Return YES if needs tab bar controller.
 * Default is NO.
 */
- (BOOL)hasTabBarController;


@end
