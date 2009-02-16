//
//  FooTest.h
//  iUnitTestTest
//
//  Created by Katsuyoshi Ito on 09/02/15.
//  Copyright 2009 ITO SOFT DESIGN Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IUTTest.h"
#import "Foo.h"


/**
 * It's test for next test.
 * Like notification that is not executed in a test... loop.
 * It will be executed in next run loop.
 * In this case, call -performTest:afterDelay: in your test methods;
 * It will be called in next run loop.
 */
@interface FooTest : IUTTest {

    Foo *foo;
    int notifiedCount;
}

@end
