//
//  IUTAssertion.m
//  iUnitTest
//
//  Created by Katsuyoshi Ito on 09/01/16.
//  Copyright 2009 ITO SOFT DESIGN Inc. All rights reserved.
//

#import "IUTAssertion.h"


NSString * const IUTAssertionExceptionName = @"IUTAssertException";
NSString * const IUTAssertionErrorExceptionName = @"IUTAssertErrorException";

NSString * const IUTAssertionInfoKey = @"IUTAssertionInfoKey";


@interface IUTAssertion(_private)
- (NSException *)assertExceptionWithInfo:(IUTAssertionInfo *)info;
@end
 

@implementation IUTAssertion

@synthesize assertedCount;


+ (IUTAssertionInfo *)assertionInfoForException:(NSException *)exception
{
    if ([[exception name] isEqualToString:IUTAssertionExceptionName] ||
        [[exception name] isEqualToString:IUTAssertionErrorExceptionName]) {
        return [[exception userInfo] objectForKey:IUTAssertionInfoKey];
    }
    return nil;
}

+ (NSException *)assertionErrorExceptionFrom:(NSException *)anException klass:(Class)klass selectorName:(NSString *)selectorString
{
    IUTAssertionInfo *info = [IUTAssertionInfo assertionInfoWithClass:klass selector:NSSelectorFromString(selectorString) message:anException.reason filePath:[NSString stringWithFormat:@"%@.m", NSStringFromClass(klass)] line:0];
    
    return [NSException exceptionWithName:IUTAssertionErrorExceptionName reason:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:info, IUTAssertionInfoKey, nil]];
}




- (void)clearAssertedCount
{
    assertedCount = 0;
}


- (NSException *)assertExceptionWithInfo:(IUTAssertionInfo *)info
{
    return [NSException exceptionWithName:IUTAssertionExceptionName reason:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:info, IUTAssertionInfoKey, nil]];
}

- (void)assert:(BOOL)value info:(IUTAssertionInfo *)info
{
    assertedCount++;
    info.expected = @"YES";
    info.actual = value ? @"YES" : @"NO";
    if (value == NO) {
        @throw [self assertExceptionWithInfo:info];
    }
}

- (void)assertSame:(id)value expected:(id)expected info:(IUTAssertionInfo *)info
{
    assertedCount++;
    info.actual = value;
    info.expected = expected;
    if (value != expected) {
        @throw [self assertExceptionWithInfo:info];
    }
}

- (void)assertNotSame:(id)value expected:(id)expected info:(IUTAssertionInfo *)info
{
    assertedCount++;
    info.actual = value;
    info.expected = expected;
    if (value == expected) {
        @throw [self assertExceptionWithInfo:info];
    }
}



- (void)assertEqual:(id)value expected:(id)expected info:(IUTAssertionInfo *)info
{
    assertedCount++;
    info.actual = value;
    info.expected = expected;
    if ([value isEqual:expected] == NO) {
        @throw [self assertExceptionWithInfo:info];
    }
}

- (void)assertNotEqual:(id)value expected:(id)expected info:(IUTAssertionInfo *)info
{
    assertedCount++;
    info.actual = value;
    info.expected = expected;
    if ([value isEqual:expected]) {
        @throw [self assertExceptionWithInfo:info];
    }
}



- (void)assertEqualInt:(int)value expected:(int)expected info:(IUTAssertionInfo *)info
{
    [self assertEqual:[NSNumber numberWithInt:value] expected:[NSNumber numberWithInt:expected] info:info];
}

- (void)assertNotEqualInt:(int)value expected:(int)expected info:(IUTAssertionInfo *)info
{
    [self assertNotEqual:[NSNumber numberWithInt:value] expected:[NSNumber numberWithInt:expected] info:info];
}


- (void)assertEqualFloat:(float)value expected:(float)expected info:(IUTAssertionInfo *)info
{
    [self assertEqual:[NSNumber numberWithFloat:value] expected:[NSNumber numberWithFloat:expected] info:info];
}

- (void)assertNotEqualFloat:(float)value expected:(float)expected info:(IUTAssertionInfo *)info
{
    [self assertNotEqual:[NSNumber numberWithFloat:value] expected:[NSNumber numberWithFloat:expected] info:info];
}

- (void)assertEqualFloat:(float)value expected:(float)expected delta:(float)delta info:(IUTAssertionInfo *)info
{
    assertedCount++;
    info.actual = [NSNumber numberWithFloat:value];
    info.expected = [NSNumber numberWithFloat:expected];
    info.delta = [NSNumber numberWithFloat:delta];
    if (fabsf(expected - value) > delta) {
        @throw [self assertExceptionWithInfo:info];
    }
}

- (void)assertEqualDouble:(double)value expected:(double)expected info:(IUTAssertionInfo *)info
{
    [self assertEqual:[NSNumber numberWithDouble:value] expected:[NSNumber numberWithDouble:expected] info:info];
}

- (void)assertNotEqualDouble:(double)value expected:(double)expected info:(IUTAssertionInfo *)info
{
    [self assertNotEqual:[NSNumber numberWithDouble:value] expected:[NSNumber numberWithDouble:expected] info:info];
}

- (void)assertEqualDouble:(double)value expected:(double)expected delta:(double)delta info:(IUTAssertionInfo *)info
{
    assertedCount++;
    info.actual = [NSNumber numberWithDouble:value];
    info.expected = [NSNumber numberWithDouble:expected];
    info.delta = [NSNumber numberWithDouble:delta];
    if (fabs(expected - value) > delta) {
        @throw [self assertExceptionWithInfo:info];
    }
}

- (void)assertNil:(id)value info:(IUTAssertionInfo *)info
{
    assertedCount++;
    info.expected = @"nil";
    info.actual = value;
    if (value != nil) {
        @throw [self assertExceptionWithInfo:info];
    }
}

- (void)assertNotNil:(id)value info:(IUTAssertionInfo *)info
{
    assertedCount++;
    info.expected = @"not nil";
    info.actual = value;
    if (value == nil) {
        @throw [self assertExceptionWithInfo:info];
    }
}

- (void)assertEqualPoint:(CGPoint)value expected:(CGPoint)expected info:(IUTAssertionInfo *)info
{
    assertedCount++;
    info.expected = NSStringFromCGPoint(expected);
    info.actual = NSStringFromCGPoint(value);
    if (!CGPointEqualToPoint(value, expected)) {
        @throw [self assertExceptionWithInfo:info];
    }
}

- (void)assertEqualSize:(CGSize)value expected:(CGSize)expected info:(IUTAssertionInfo *)info
{
    assertedCount++;
    info.expected = NSStringFromCGSize(expected);
    info.actual = NSStringFromCGSize(value);
    if (!CGSizeEqualToSize(value, expected)) {
        @throw [self assertExceptionWithInfo:info];
    }
}

- (void)assertEqualRect:(CGRect)value expected:(CGRect)expected info:(IUTAssertionInfo *)info
{
    assertedCount++;
    info.expected = NSStringFromCGRect(expected);
    info.actual = NSStringFromCGRect(value);
    if (!CGPointEqualToPoint(value.origin, expected.origin) || !CGSizeEqualToSize(value.size, expected.size)) {
        @throw [self assertExceptionWithInfo:info];
    }
}

@end
