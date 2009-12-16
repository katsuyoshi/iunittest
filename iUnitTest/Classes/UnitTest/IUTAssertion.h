//
//  IUTAssertion.h
//  iUnitTest
//
//  Created by Katsuyoshi Ito on 09/01/16.
//  Copyright 2009 ITO SOFT DESIGN Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IUTAssertionInfo.h"
#import "SenTestAssertion.h"


#define ASSERT(value) [self assert:(value) info:IUTASSERTION_INF(nil)]

#define ASSERT_FAIL(m) [self assert:NO info:IUTASSERTION_INF(m)]

#define ASSERT_SAME(_expected, _value) [self assertSame:(_value) expected:(_expected) info:IUTASSERTION_INF(nil)]
#define ASSERT_NOT_SAME(_expected, _value) [self assertNotSame:(_value) expected:(_expected) info:IUTASSERTION_INF(nil)]


#define ASSERT_EQUAL(_expected, _value) [self assertEqual:(_value) expected:(_expected) info:IUTASSERTION_INF(nil)]
#define ASSERT_NOT_EQUAL(_expected, _value) [self assertNotEqual:(_value) expected:(_expected) info:IUTASSERTION_INF(nil)]

#define ASSERT_EQUAL_INT(_expected, _value) [self assertEqualInt:(int)(_value) expected:(int)(_expected) info:IUTASSERTION_INF(nil)]
#define ASSERT_NOT_EQUAL_INT(_expected, _value) [self assertNotEqualInt:(int)(_value) expected:(int)(_expected) info:IUTASSERTION_INF(nil)]

#define ASSERT_EQUAL_FLOAT(_expected, _value) [self assertEqualFloat:(float)(_value) expected:(float)(_expected) info:IUTASSERTION_INF(nil)]
#define ASSERT_NOT_EQUAL_FLOAT(_expected, _value) [self assertNotEqualFloat:(float)(_value) expected:(float)(_expected) info:IUTASSERTION_INF(nil)]
#define ASSERT_EQUAL_FLOAT_DELTA(_expected, _value, _delta) [self assertEqualFloat:(float)(_value) expected:(float)(_expected) delta:(float)_delta info:IUTASSERTION_INF(nil)]

#define ASSERT_EQUAL_DOUBLE(_expected, _value) [self assertEqualDouble:(float)(_value) expected:(float)(_expected) info:IUTASSERTION_INF(nil)]
#define ASSERT_NOT_EQUAL_DOUBLE(_expected, _value) [self assertNotEqualDouble:(float)(_value) expected:(float)(_expected) info:IUTASSERTION_INF(nil)]
#define ASSERT_EQUAL_DOUBLE_DELTA(_expected, _value, _delta) [self assertEqualDouble:(float)(_value) expected:(float)(_expected) delta:(float)_delta info:IUTASSERTION_INF(nil)]


#define ASSERT_NIL(_value) [self assertNil:(_value) info:IUTASSERTION_INF(nil)]
#define ASSERT_NOT_NIL(_value) [self assertNotNil:(_value) info:IUTASSERTION_INF(nil)]


#define ASSERT_EQUAL_POINT(_expected, _value) [self assertEqualPoint:(_value) expected:(_expected) info:IUTASSERTION_INF(nil)]
#define ASSERT_EQUAL_SIZE(_expected, _value) [self assertEqualSize:(_value) expected:(_expected) info:IUTASSERTION_INF(nil)]
#define ASSERT_EQUAL_RECT(_expected, _value) [self assertEqualRect:(_value) expected:(_expected) info:IUTASSERTION_INF(nil)]


#define ASSERT_RAISE(expr) \
    do { \
        @try { \
            {expr;}\
        } \
        @catch (id anException) { \
            assertedCount++; \
            continue; \
        } \
        ASSERT_FAIL(@"exception expected but none was thrown."); \
    } while(0)

#define ASSERT_NOTHING_RAISED(expr) \
    do { \
        @try { \
            {expr;}\
            assertedCount++; \
        } \
        @catch (id anException) { \
            ASSERT_FAIL(([NSString stringWithFormat:@"Exception raised:%@", anException])); \
        } \
    } while(0)


#define ASSERT_EQUAL_LOCALIZED_STRING(_expected, _value) ASSERT_EQUAL(NSLocalizedString(_expected, nil), _value)

#define ASSERT_EQUAL_LOCALIZED_STRING_FROM_TABLE(_expected, _table, _value) ASSERT_EQUAL(NSLocalizedStringFromTable(_expected, _table, nil), _value)


#pragma mark -
#pragma mark helper

#define TEST_IDLE(sel,t) \
    [self performTest:@selector(_ ## sel) afterDelay:t];\
}\
- (void)_ ## sel {\


#define SETUP_IDLE(sel,t) \
    [self performSetUpSequence:@selector(_ ## sel) afterDelay:t];\
}\
- (void)_ ## sel {\



#pragma mark -

extern NSString * const IUTAssertionExceptionName;
extern NSString * const IUTAssertionErrorExceptionName;

extern NSString * const IUTAssertionInfoKey;


@interface IUTAssertion : NSObject {
    int assertedCount;
}

@property (readonly) int assertedCount;

+ (NSException *)assertionErrorExceptionFrom:(NSException *)exception klass:(Class)klass selectorName:(NSString *)selectorString;

- (void)clearAssertedCount;

- (void)assert:(BOOL)value info:(IUTAssertionInfo *)info;

- (void)assertSame:(id)value expected:(id)expected info:(IUTAssertionInfo *)info;
- (void)assertNotSame:(id)value expected:(id)expected info:(IUTAssertionInfo *)info;

- (void)assertEqual:(id)value expected:(id)expected info:(IUTAssertionInfo *)info;
- (void)assertNotEqual:(id)value expected:(id)expected info:(IUTAssertionInfo *)info;

- (void)assertEqualInt:(int)value expected:(int)expected info:(IUTAssertionInfo *)info;
- (void)assertNotEqualInt:(int)value expected:(int)expected info:(IUTAssertionInfo *)info;

- (void)assertEqualFloat:(float)value expected:(float)expected info:(IUTAssertionInfo *)info;
- (void)assertNotEqualFloat:(float)value expected:(float)expected info:(IUTAssertionInfo *)info;
- (void)assertEqualFloat:(float)value expected:(float)expected delta:(float)delta info:(IUTAssertionInfo *)info;

- (void)assertEqualDouble:(double)value expected:(double)expected info:(IUTAssertionInfo *)info;
- (void)assertNotEqualDouble:(double)value expected:(double)expected info:(IUTAssertionInfo *)info;
- (void)assertEqualDouble:(double)value expected:(double)expected delta:(double)delta info:(IUTAssertionInfo *)info;

- (void)assertNil:(id)value info:(IUTAssertionInfo *)info;
- (void)assertNotNil:(id)value info:(IUTAssertionInfo *)info;

- (void)assertEqualPoint:(CGPoint)value expected:(CGPoint)expected info:(IUTAssertionInfo *)info;
- (void)assertEqualSize:(CGSize)value expected:(CGSize)expected info:(IUTAssertionInfo *)info;
- (void)assertEqualRect:(CGRect)value expected:(CGRect)expected info:(IUTAssertionInfo *)info;

@end
