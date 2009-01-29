//
//  iUnitTest.h
//  iUnitTest
//
//  Created by Katsuyoshi Ito on 09/01/16.
//  Copyright 2009 ITO SOFT DESIGN Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IUTAssertion.h"


@interface IUTTest : IUTAssertion {
    NSMutableArray *tests;

    NSTimeInterval testAfterDelay;
}

@property (retain, readonly) NSMutableArray *tests;

@property NSTimeInterval testAfterDelay;


- (void)setUp;
- (void)tearDown;


@end
