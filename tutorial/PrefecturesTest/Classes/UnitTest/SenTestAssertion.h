/*
 *  SenTestAssertion.h
 *  iUnitTest
 *
 *  Created by Katsuyoshi Ito on 09/02/03.
 *  Copyright 2009 ITO SOFT DESIGN Inc. All rights reserved.
 *
 */

#define STAssertNil(a1, description, ...) \
    ASSERT_NIL(a1)

#define STAssertNotNil(a1, description, ...) \
    ASSERT_NOT_NIL(a1)

#define STAssertTrue(expression, description, ...) \
    ASSERT(expression)

#define STAssertFalse(expression, description, ...) \
    ASSERT(!expression)

#define STAssertEqualObjects(a1, a2, description, ...) \
    ASSERT_EQUAL(a1, a2)

#define STAssertEquals(a1, a2, description, ...) \
    { \
        char *e = @encode(__typeof(a1)); \
        if (*e == 'i') { \
            ASSERT_EQUAL_INT((a1), (int)(a2)); \
        } \
        else \
        if (*e == 'f') { \
            ASSERT_EQUAL_FLOAT((a1), (float)(a2)); \
        } \
        else \
        if (*e == 'd') { \
            ASSERT_EQUAL_DOUBLE((a1), (double)(a2)); \
        } else { \
            ASSERT_FAIL(@"not supported in this case."); \
        } \
    }


#define STAssertEqualsWithAccuracy(left, right, accuracy, description, ...) \
    { \
        char *e = @encode(__typeof(left)); \
        if (*e == 'f') { \
            ASSERT_EQUAL_FLOAT_DELTA((left), (float)(right), (float)(accuracy)); \
        } \
        else \
        if (*e == 'd') { \
            ASSERT_EQUAL_DOUBLE_DELTA((left), (double)(right), (double)(accuracy)); \
        } else { \
            ASSERT_FAIL(@"not supported in this case."); \
        } \
    }


#define STAssertThrows(expression, description, ...) \
    ASSERT_RAISE(expression)

/* FIXME: not suuported
#define STAssertThrowsSpecific(expression, specificException, description, ...) \
#define STAssertThrowsSpecificNamed(expr, specificException, aName, description, ...) \
*/

#define STAssertNoThrow(expression, description, ...) \
    ASSERT_NOTHING_RAISED(expression)
    
/* FIXME: not suuported
#define STAssertNoThrowSpecific(expression, specificException, description, ...) \
#define STAssertNoThrowSpecificNamed(expr, specificException, aName, description, ...) \
*/

#define STFail(description, ...) \
    ASSERT_FAIL(([NSString stringWithFormat:description, ##__VA_ARGS__]))


/* FIXME: not suuported
#define STAssertTrueNoThrow(expression, description, ...) \
#define STAssertFalseNoThrow(expression, description, ...) \
*/
