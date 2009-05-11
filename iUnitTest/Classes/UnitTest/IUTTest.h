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
    
    SEL nextTest;
    NSTimeInterval nextTestAfterDelay;
}

@property (retain, readonly) NSMutableArray *tests;

@property NSTimeInterval testAfterDelay;

@property SEL nextTest;
@property NSTimeInterval nextTestAfterDelay;

/**
 * Returns a Boolean value that indicates whether to collect tests in super class.
 * default is NO.
 * @return YES if collect tests in super class, otherwise NO.
 */
+ (BOOL)doesCollectTestsInSuper;

/**
 * Returns a Boolean value that indicates whether to test even sucessed in RunFailuresOnly setting.
 * default is NO.
 * @return YES if force tests in this class, otherwise NO.
 */
+ (BOOL)forceTestsAnyway;


- (void)setUp;
- (void)tearDown;

- (void)performTest:(SEL)selector afterDelay:(NSTimeInterval)delay;

@end
