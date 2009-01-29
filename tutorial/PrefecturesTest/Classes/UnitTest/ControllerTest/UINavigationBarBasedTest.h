//
//  UINavigationBarBasedTest.h
//  iUnitTest
//
//  Created by Katsuyoshi Ito on 09/01/17.
//  Copyright 2009 ITO SOFT DESIGN Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IUTTest.h"


@interface UINavigationBarBasedTest : IUTTest {
    UIWindow *window;
    UINavigationController *navigationController;
}

@property (retain, readonly) UIWindow *window;
@property (retain, readonly) UINavigationController *navigationController;


// Override to return a view controller that is tested.
@property (assign, readonly) UIViewController *rootViewController;

@end
