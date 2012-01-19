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
- (void)collectTestsForClass:(Class)klass;
- (void)collectTests;
@end

@implementation IUTTest

@synthesize tests, testAfterDelay;
@synthesize nextSetUpSequence, nextSetUpSequenceAfterDelay;
@synthesize nextTest, nextTestAfterDelay;


+ (BOOL)doesCollectTestsInSuper
{
    return NO;
}

+ (BOOL)forceTestsAnyway
{
    return NO;
}

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

- (void)collectTestKeywordTestsForClass:(Class)klass
{
    unsigned int count;
    NSRange range = NSMakeRange(0, [@"test" length]);
    Method *methods = class_copyMethodList(klass, &count);
    Method *methodPtr = methods;
    for (int i = 0; i < count; i++, methodPtr++) {
        Method aMethod = *methodPtr;
        NSString *selectorName = NSStringFromSelector(method_getName(aMethod));
        if ([selectorName compare:@"test" options:NSCaseInsensitiveSearch range:range] == 0) {
            // if already has selectorName, it will be overrided. Then ignore this methods.
            if (![tests containsObject:selectorName]) {
                [tests addObject:selectorName];
            }
        }
    }
    free(methods);
}

- (void)collectShouldKeywordTestsForClass:(Class)klass
{
    unsigned int count;
    Method *methods = class_copyMethodList(klass, &count);
    Method *methodPtr = methods;
    for (int i = 0; i < count; i++, methodPtr++) {
        Method aMethod = *methodPtr;
        NSString *selectorName = NSStringFromSelector(method_getName(aMethod));
        NSRange ragne = [selectorName rangeOfString:@"Should"];
        if (ragne.location != NSNotFound) {
            // if already has selectorName, it will be overrided. Then ignore this methods.
            if (![tests containsObject:selectorName]) {
                [tests addObject:selectorName];
            }
        }
    }
    free(methods);
}

- (void)collectTestsForClass:(Class)klass
{
    [self collectTestKeywordTestsForClass:klass];
    [self collectShouldKeywordTestsForClass:klass];
}

- (void)collectTests
{
    Class rootClass = [IUTTest class];
    Class klass = [self class];

    [self collectTestsForClass:klass];
    
    while((klass != rootClass) && [klass doesCollectTestsInSuper]) {
        klass = [klass superclass];
        [self collectTestsForClass:klass];
    }
}


- (NSNumber *)willSetUp
{
    return [NSNumber numberWithDouble:0.0];
}

- (void)setUp
{
}

- (NSNumber *)didSetUp
{
    return [NSNumber numberWithDouble:testAfterDelay];
}


- (NSNumber *)willTearDown
{
    return [NSNumber numberWithDouble:0.0];
}

- (void)tearDown
{
}

- (NSNumber *)didTearDown
{
    return [NSNumber numberWithDouble:0.0];
}


- (void)performSetUpSequence:(SEL)selector afterDelay:(NSTimeInterval)delay
{
    self.nextSetUpSequence = selector;
    self.nextSetUpSequenceAfterDelay = delay;
}

- (void)performTest:(SEL)selector afterDelay:(NSTimeInterval)delay
{
    self.nextTest = selector;
    self.nextTestAfterDelay = delay;
}


@end
