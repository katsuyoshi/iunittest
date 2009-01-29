//
//  IUTResultTableViewCellTest.m
//  iUnitTest
//
//  Created by Katsuyoshi Ito on 09/01/17.
//  Copyright 2009 ITO SOFT DESIGN Inc. All rights reserved.
//

#import "IUTResultTableViewCellTest.h"


@implementation IUTResultTableViewCellTest

- (void)setUp
{
    [super setUp];
    cell = [[IUTResultTableViewCell alloc] initWithFrame:CGRectZero];
}

- (void)tearDown
{
    [cell release];
    cell = nil;
    [super tearDown];
}

- (void)dealloc
{
    [cell release];
    [super dealloc];
}

- (void)testInitialize
{
    ASSERT_EQUAL_INT(14, cell.resultLabel.font.pointSize);
    ASSERT_EQUAL_INT(0, cell.resultLabel.numberOfLines);

    ASSERT_EQUAL_INT(UITableViewCellSelectionStyleBlue, cell.selectionStyle);
}

@end
