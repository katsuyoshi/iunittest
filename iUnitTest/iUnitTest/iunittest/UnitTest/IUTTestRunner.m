//
//  IUTTestRunner.m
//  iUnitTest
//
//  Created by Katsuyoshi Ito on 09/01/16.
//  Copyright 2009 ITO SOFT DESIGN Inc. All rights reserved.
//

#import "IUTTestRunner.h"
#import "IUTTest.h"
#import "/usr/include/objc/objc-class.h"
#import "IUTLog.h"
#import "IUTPreference.h"
#import "NSExceptionExtension.h"


@interface IUTTestRunner(_private)
- (BOOL)isSubclassOf:(Class)class;
- (void)collectTestSites;
- (void)performSelectorWithSelectorAndTargetArray:(NSArray *)arg;
- (void)performSelectorOnMainThread:(NSString *)selectorString target:(id)target;
- (void)performSelectorWithSelectorAndTargetArray2:(NSArray *)arg;
- (void)performSelectorOnMainThread2:(NSString *)selectorString target:(id)target;
- (void)runSetUp:(IUTTest *)site;
- (void)runSetUpSequence:(IUTTest *)site;
- (void)runTest:(IUTTest *)site selector:(NSString *)testSel;
- (void)runTearDown:(IUTTest *)site;
- (void)wait:(NSTimeInterval)time;
@end

@implementation IUTTestRunner

@synthesize sites, tests, passes, fails, errors, exception;

- (id)init
{
    self = [super init];
    if (self) {
        sites = [NSMutableArray new];
        passes = [NSMutableArray new];
        fails = [NSMutableArray new];
        errors = [NSMutableArray new];
        tests = [NSMutableArray new];
        [self collectTestSites];
    }
    return self;
}


- (void)dealloc
{
    [exception release];
    [tests release];
    [sites release];
    [passes release];
    [fails release];
    [errors release];
    [super dealloc];
}

- (BOOL)isSubclassOf:(Class)class
{
    if (class_isMetaClass(class) == NO) {
        Class testclass = [IUTTest class];
        Class superclass = class_getSuperclass(class);
        while (superclass != Nil) {
            if (superclass->isa == testclass->isa) {
                if (class->isa != testclass->isa) {
                    return YES;
                }
            }
            superclass = class_getSuperclass(superclass);
        }
    }
    return NO;
}

- (void)collectTestSites
{
    int count;
    Class *classes = NULL;
    Class *classPtr;
 
    count = objc_getClassList(NULL, 0);
 
    if (count > 0) {
        NSAutoreleasePool *pool = [NSAutoreleasePool new];
        classes = malloc(sizeof(Class) * count);
        count = objc_getClassList(classes, count);
        classPtr = classes;
        for (int i = 0; i < count; i++, classPtr++) {
            Class aClass = *classPtr;
            if ([self isSubclassOf:aClass]) {
                IUTTest *site = (IUTTest *)[[aClass new] autorelease];
                if ([site.tests count]) {
                    [sites addObject:site];
                }
            }
        }
        free(classes);
        [pool release];
    }
}


- (NSString *)result
{
    NSMutableString *str = [NSMutableString string];
    int count;
    
    count = [tests count];
    [str appendFormat:(count > 1) ? @"%d tests" : @"%d test", count];
    count = self.assertedCount;
    [str appendFormat:(count > 1) ? @", %d assertions" : @", %d assertion", count];
    count = [fails count];
    [str appendFormat:(count > 1) ? @", %d failures" : @", %d failure", count];
    count = [errors count];
    [str appendFormat:(count > 1) ? @", %d errors" : @", %d error", count];
    return str;
}

- (int)assertedCount
{
    int count = 0;
    for (IUTTest *site in sites) {
        count += site.assertedCount;
    }
    return count;
}

- (int)allTestCount
{
    int count = 0;
    for (IUTTest *site in sites) {
        count += [site.tests count];
    }
    return count;
}

- (int)badgeNumber
{
    return [fails count] + [errors count];
}


#pragma mark -
#pragma mark query result

- (BOOL)isPassed
{
    return !self.hasErrors && !self.hasFailures && [self.passes count];
}

- (BOOL)hasErrors
{
    return [self.errors count];
}

- (BOOL)hasFailures
{
    return [self.fails count];
}


#pragma mark -
#pragma mark colors

+ (UIColor *)successColor
{
    return [UIColor colorWithRed:128.0 / 255.0 green:255.0 / 255.0 blue:0.0 / 255.0 alpha:1.0]; // Lime
}

+ (UIColor *)failureColor
{
    return [UIColor yellowColor];
}

+ (UIColor *)failureColor2
{
    return [self successColor];
}

+ (UIColor *)errorColor
{
    return [UIColor redColor];
}

+ (UIColor *)idleColor
{
    return [UIColor colorWithRed:230.0 / 255.0 green:230.0 / 255.0 blue:230.0 / 255.0 alpha:1.0];  // Mercury
}

- (UIColor *)successColor
{
    return [[self class] successColor];
}

- (UIColor *)failureColor
{
    return [[self class] failureColor];
}

- (UIColor *)failureColor2
{
    return [[self class] failureColor2];
}

- (UIColor *)errorColor
{
    return [[self class] errorColor];
}

- (UIColor *)idleColor
{
    return [[self class] idleColor];
}

- (UIColor *)backgroundColor
{
    if (self.hasErrors) {
        return self.errorColor;
    } else
    if (self.hasFailures) {
        return self.failureColor;
    } else
    if (self.isPassed) {
        return self.successColor;
    }
    return self.idleColor;
}


#pragma mark -
#pragma mark execute tests

- (void)performSelectorWithSelectorAndTargetArray:(NSArray *)arg
{
    SEL selector = NSSelectorFromString([arg objectAtIndex:0]);
    id target = [arg objectAtIndex:1];
    @try {
        [target performSelector:selector];
    }
    @catch (NSException * e) {
        self.exception = e;
    }
}

- (void)performSelectorOnMainThread:(NSString *)selectorString target:(id)target
{
    NSArray *arg = [[NSArray alloc] initWithObjects:selectorString, target, nil];
    [self performSelectorOnMainThread:@selector(performSelectorWithSelectorAndTargetArray:) withObject:arg waitUntilDone:YES];
    [arg release];
}

- (void)performSelectorWithSelectorAndTargetArray2:(NSArray *)arg
{
    SEL selector = NSSelectorFromString([arg objectAtIndex:0]);
    id target = [arg objectAtIndex:1];
    @try {
         delay = [[target performSelector:selector] doubleValue];
    }
    @catch (NSException * e) {
        self.exception = e;
    }
}

- (void)performSelectorOnMainThread2:(NSString *)selectorString target:(id)target
{
    NSArray *arg = [[NSArray alloc] initWithObjects:selectorString, target, nil];
    [self performSelectorOnMainThread:@selector(performSelectorWithSelectorAndTargetArray2:) withObject:arg waitUntilDone:YES];
    [arg release];
}


- (void)runSetUp:(IUTTest *)site
{
IUTLog(@"  　　setUp");
    [self performSelectorOnMainThread2:@"willSetUp" target:site];
    if (self.exception) @throw self.exception;
    [self wait:delay];
    
    [self performSelectorOnMainThread:@"setUp" target:site];
    if (self.exception) @throw self.exception;
    [self wait:delay];
    
    [self performSelectorOnMainThread2:@"didSetUp" target:site];
    if (self.exception) @throw self.exception;
    [self wait:delay];
}

- (void)runSetUpSequence:(IUTTest *)site
{
IUTLog(@"  　　setUpSequence");
            
    // next test
    while(site.nextSetUpSequence) {
        SEL aSelector = site.nextSetUpSequence;
        site.nextSetUpSequence = NULL;
        [self wait:site.nextSetUpSequenceAfterDelay];

IUTLog(@"  　　  %@", NSStringFromSelector(aSelector));
        [self performSelectorOnMainThread:NSStringFromSelector(aSelector) target:site];
        if (self.exception) {
            @throw self.exception;
        }
    }
}

- (void)runTest:(IUTTest *)site selector:(NSString *)testSel
{
IUTLog(@"  　　test");
            
    [self performSelectorOnMainThread:testSel target:site];
    if (self.exception) @throw self.exception;
                
    // next test
    while(site.nextTest) {
        SEL aSelector = site.nextTest;
        site.nextTest = NULL;
        [self wait:site.nextTestAfterDelay];

IUTLog(@"  　　  %@", NSStringFromSelector(aSelector));
        [self performSelectorOnMainThread:NSStringFromSelector(aSelector) target:site];
        if (self.exception) {
            @throw self.exception;
        }
    }
}

- (void)runTearDown:(IUTTest *)site
{
    self.exception = nil;

IUTLog(@"  　　tearDown");
    @try {
        [self performSelectorOnMainThread2:@"willTearDown" target:site];
        [self wait:delay];
    } @finally {
        @try {
            [self performSelectorOnMainThread:@"tearDown" target:site];
        } @finally {
            @try {
                [self performSelectorOnMainThread2:@"didTearDown" target:site];
                [self wait:delay];
            } @finally {
                if (self.exception) @throw self.exception;
            }
        }
    }
    
}


- (void)wait:(NSTimeInterval)time
{
    if (time != 0.0) {
        [NSThread sleepForTimeInterval:time];
    }
}

- (void)run:(id)sender
{
    NSAutoreleasePool *pool = [NSAutoreleasePool new];
    [tests removeAllObjects];
    [passes removeAllObjects];
    [fails removeAllObjects];
    [errors removeAllObjects];
    
    stopRequest = NO;
    
    [sender performSelectorOnMainThread:@selector(willTest:) withObject:nil waitUntilDone:YES];

    float count = (float)[self allTestCount];
    int i = 0;
    IUTPreference *preference = [IUTPreference sharedPreference];

    for (IUTTest *site in sites) {
        NSString *siteName = NSStringFromClass([site class]);
IUTLog(@"%@", siteName);
        [site clearAssertedCount];
        for (NSString *testSel in site.tests) {
            if (stopRequest) {
                goto ABORT_TEST;
            }
            if (![preference needsTest:siteName methodName:testSel]) {
// DEBUGME: IUTLog(@"  %@ was skiped", testSel);
                continue;
            }
            
            @try {
IUTLog(@"  %@", testSel);
                [tests addObject:testSel];
                
                [self runSetUp:site];
                [self runSetUpSequence:site];
                [self runTest:site selector:testSel];
                
                [passes addObject:testSel];
                [preference addPassedTest:siteName methodName:testSel];
            } @catch (NSException * e) {
                if ([e isFailure]) {
IUTLog(@"    *** Fail:%@", e.assertionInfo.message);
                    [fails addObject:e];
                } else {
                    NSException *anException = [IUTAssertion assertionErrorExceptionFrom:e klass:[site class] selectorName:testSel];
IUTLog(@"    *** Error:%@", e.assertionInfo.message);
                    [errors addObject:anException];
                }
            } @finally {
                @try {
                    [self runTearDown:site];
                } @catch (NSException * e) {
                
                    NSException *anException = [IUTAssertion assertionErrorExceptionFrom:e klass:[site class] selectorName:testSel];
IUTLog(@"    *** Error:%@", e.assertionInfo.message);
                    [errors addObject:anException];
                    
                } @finally {
                    i++;
                    [sender performSelectorOnMainThread:@selector(setProgress:) withObject:[NSNumber numberWithFloat:(float)i / (float)count] waitUntilDone:YES];
                    self.exception = nil;
                }
            }
        }
    }

ABORT_TEST:

    // store result to preference
    if (self.isPassed) {
        [preference clearPassedTests];
    }
    [preference synchronize];
    
    // notify didTest
    [sender performSelectorOnMainThread:@selector(didTest:) withObject:nil waitUntilDone:YES];
    
    [pool release];
    [NSThread exit];
}

- (void)stop:(id)sender
{
    stopRequest = YES;
}



@end
