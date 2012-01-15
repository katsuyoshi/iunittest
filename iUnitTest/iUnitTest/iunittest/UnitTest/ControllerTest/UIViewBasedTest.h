//
//  UIViewBasedTest.h
//  iUnitTest
//
//  Created by Katsuyoshi Ito on 09/06/19.
//  Copyright 2009 ITO SOFT DESIGN Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IUTTest.h"


@interface UIViewBasedTest : IUTTest {
    UIWindow *window;
    UIViewController *viewController;
}

@property (retain, readonly) UIWindow *window;
@property (retain, readonly) UIViewController *viewController;

@end
