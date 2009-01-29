//
//  IUTTestRunnerMock.h
//  iUnitTest
//
//  Created by Katsuyoshi Ito on 09/01/17.
//  Copyright 2009 ITO SOFT DESIGN Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IUTTestRunner.h"
#import "IUTTest.h"


@interface IUTTestRunnerMock : IUTTestRunner {
    int assertedCount;
}

@property int assertedCount;

@end


@interface IUTAssertGenerator : IUTTest
{
}

- (NSException *)exception;
- (NSException *)exceptionEqual;
- (NSException *)exceptionEqualFloatDelta;
- (NSException *)errorException;

@end
