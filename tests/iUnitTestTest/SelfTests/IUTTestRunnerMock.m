//
//  IUTTestRunnerMock.m
//  iUnitTest
//
//  Created by Katsuyoshi Ito on 09/01/17.
//  Copyright 2009 ITO SOFT DESIGN Inc. All rights reserved.
//

#import "IUTTestRunnerMock.h"

@interface IUTTestRunnerMock(_private)
- (void)setDummyResult;
@end

@implementation IUTTestRunnerMock

@synthesize assertedCount;

- (id)init
{
    self = [super init];
    if (self) {
        [self setDummyResult];
    }
    return self;
}


- (void)setDummyResult
{
    IUTAssertGenerator *generator = [IUTAssertGenerator new];
    
    [self.fails removeAllObjects];
    [self.fails addObject:[generator exception]];
    [self.fails addObject:[generator exceptionEqual]];
    [self.fails addObject:[generator exceptionEqualFloatDelta]];

    [self.errors removeAllObjects];
    [self.errors addObject:[generator errorException]];
    [self.errors addObject:[generator errorException]];

    [generator release];
}


@end


@implementation IUTAssertGenerator

- (NSException *)exception
{
    NSException *exception;
    @try {
        ASSERT_FAIL(@"It will be failed.");
    }
    @catch (NSException * e) {
        exception = [e retain];
    }
    return [exception autorelease];
}

- (NSException *)exceptionEqual
{
    NSException *exception;
    @try {
        ASSERT_EQUAL(@"abc", @"def");
    }
    @catch (NSException * e) {
        exception = [e retain];
    }
    return [exception autorelease];
}

- (NSException *)exceptionEqualFloatDelta
{
    NSException *exception;
    @try {
        ASSERT_EQUAL([NSArray arrayWithObject:@"abc"], [NSArray arrayWithObject:@"def"]);
    }
    @catch (NSException * e) {
        exception = [e retain];
    }
    return [exception autorelease];
}

- (NSException *)errorException
{
    NSException *exception;
    @try {
        NSArray *array = [NSArray array];
        id obj = [array objectAtIndex:1];
        [obj count];
    }
    @catch (NSException * e) {
        exception = [e retain];
    }
    return [exception autorelease];
}



@end
