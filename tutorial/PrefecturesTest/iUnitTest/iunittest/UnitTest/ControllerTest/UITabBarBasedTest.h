//
//  UITabBarBasedTest.h
//  iUnitTest
//
//  Created by Katsuyoshi Ito on 09/01/17.
//  Copyright 2009 ITO SOFT DESIGN Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IUTTest.h"


@interface UITabBarBasedTest : IUTTest {
    UIWindow *window;
    UITabBarController *tabBarController;
}

@property (retain, readonly) UIWindow *window;
@property (retain, readonly) UITabBarController *tabBarController;

// Override to return view controllers that is tested.
/** @TypeInfo UIViewController */
@property (assign, readonly) NSArray *viewControllers;

@end
