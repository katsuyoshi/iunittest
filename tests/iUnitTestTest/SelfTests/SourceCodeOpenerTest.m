//
//  SourceCodeOpenerTest.m
//  iUnitTestTest
//
//  Created by Katsuyoshi Ito on 09/04/27.
//  Copyright 2009 ITO SOFT DESIGN Inc. All rights reserved.
//

#import "SourceCodeOpenerTest.h"


#if TARGET_IPHONE_SIMULATOR

/*
 * run 'opencode' before test here.
 */
@implementation SourceCodeOpenerTest

- (void)setUp
{
    [super setUp];
    opener = [[SourceCodeOpener sourceCodeOpener] retain];
    // wait to find the opencode service.
    testAfterDelay = 0.5;
}

- (void)tearDown
{
    [opener release];
    [super tearDown];
}

- (void)dealloc
{
    [super dealloc];
}


#pragma mark -
#pragma mark Helpers


#pragma mark -
#pragma mark Tests

- (void)testOpen
{
    // If success, this line will be hilighted.
    [opener open:IUTASSERTION_INF(nil)];
}

- (void)testOpenHere
{
    // If success, this line will be hilighted.
    SOURCE_CODE_OPENER_OPEN_HERE();
}


@end

#endif
