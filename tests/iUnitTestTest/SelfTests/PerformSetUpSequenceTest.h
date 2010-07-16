//
//  PerformSetUpSequenceTest.h
//  iUnitTestTest
//
//  Created by Katsuyoshi Ito on 09/11/17.
//  Copyright 2009 ITO SOFT DESIGN Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IUTTest.h"
#import "Foo.h"


@interface PerformSetUpSequenceTest : IUTTest {

    Foo *foo;
    int notifiedCount;

}

@end
