//
//  NSExceptionExtension.m
//  iUnitTest
//
//  Created by Katsuyoshi Ito on 09/05/14.
//  Copyright 2009 ITO SOFT DESIGN Inc. All rights reserved.
//

#import "NSExceptionExtension.h"
#import "IUTAssertion.h"
#import "IUTTestRunner.h"


@implementation NSException(IUTAssertionInfo)

- (IUTAssertionInfo *)assertionInfo
{
    if ([self isFailure] || [self isError]) {
        return [[self userInfo] objectForKey:IUTAssertionInfoKey];
    }
    return nil;
}

- (BOOL)isFailure
{
    return [[self name] isEqualToString:IUTAssertionExceptionName];
}

- (BOOL)isError
{
    return [[self name] isEqualToString:IUTAssertionErrorExceptionName];
}

@end

@implementation NSException(IUTResultTableViewCell)

- (UIColor *)color
{
    IUTAssertionInfo *info = self.assertionInfo;
    
    if ([self isFailure]) {
        return [info.methodName isEqualToString:@"testThisClassAlways"] ? [IUTTestRunner failureColor2] : [IUTTestRunner failureColor];
    } else
    if ([self isError]) {
        return [IUTTestRunner errorColor];
    }
    return nil;
}

@end

