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

/** This properties were deprecated in iPhone OS 3.0. didSetUp method should return delay time. */
@property NSTimeInterval testAfterDelay __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_NA,__MAC_NA,__IPHONE_2_2,__IPHONE_3_0);

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


- (NSNumber *)willSetUp;
- (void)setUp;
- (NSNumber *)didSetUp;

- (NSNumber *)willTearDown;
- (void)tearDown;
- (NSNumber *)didTearDown;


- (void)performTest:(SEL)selector afterDelay:(NSTimeInterval)delay;

@end
