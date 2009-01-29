//
//  iUnitTest.m
//  iUnitTest
//
//  Created by Katsuyoshi Ito on 09/01/16.
//  Copyright 2009 ITO SOFT DESIGN Inc. All rights reserved.
//

#import "IUTTest.h"
#import "/usr/include/objc/objc-class.h"


@interface IUTTest(_private)
- (void)collectTests;
@end

@implementation IUTTest

@synthesize tests, testAfterDelay;


- (id)init
{
    self = [super init];
    if (self) {
        tests = [NSMutableArray new];
        [self collectTests];
    }
    return self;
}

- (void)dealloc
{
    [tests release];
    [super dealloc];
}

- (void)collectTests
{
    unsigned int count;
    NSRange range = NSMakeRange(0, [@"test" length]);
    Method *methods = class_copyMethodList([self class], &count);
    Method *methodPtr = methods;
    for (int i = 0; i < count; i++, methodPtr++) {
        Method aMethod = *methodPtr;
        NSString *selectorName = NSStringFromSelector(method_getName(aMethod));
        if ([selectorName compare:@"test" options:NSCaseInsensitiveSearch range:range] == 0) {
            [tests addObject:selectorName];
        }
    }
    free(methods);
}

- (void)setUp
{
}

- (void)tearDown
{
}

@end
