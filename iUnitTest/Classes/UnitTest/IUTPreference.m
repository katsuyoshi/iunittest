//
//  IUTPreference.m
//  iUnitTestTest
//
//  Created by Katsuyoshi Ito on 09/02/26.
//  Copyright 2009 ITO SOFT DESIGN Inc. All rights reserved.
//

#import "IUTPreference.h"

#define AUTO_RUN_KEY    @"AUTO_RUN"
#define RUN_FAILURES_ONLY_KEY    @"RUN_FAILURES_ONLY"
#define PASSED_TESTS_KEY    @"PASSED_TESTS"


@implementation IUTPreference


+ (id)sharedPreference
{
    static id preference = nil;
    if (preference == nil) {
        preference = [self new];
    }
    return preference;
}

- (id)init
{
    self = [super init];
    if (self) {
        NSDictionary *defaults = [NSDictionary dictionaryWithObjectsAndKeys:
                        [NSNumber numberWithBool:YES], AUTO_RUN_KEY,
                        [NSNumber numberWithBool:YES], RUN_FAILURES_ONLY_KEY,
                        nil];
        [[NSUserDefaults standardUserDefaults] registerDefaults:defaults];
    }
    return self;
}

- (void)dealloc
{
    [self synchronize];
    [passedTests release];
    [userDefaults release];
    [super dealloc];
}

- (NSUserDefaults *)userDefaults
{
    if (userDefaults == nil) {
        userDefaults = [NSUserDefaults standardUserDefaults];
    }
    return userDefaults;
}


- (BOOL)isAutoRun
{
    return [self.userDefaults boolForKey:AUTO_RUN_KEY];
}

- (BOOL)isRunFailuresOnly
{
    return [self.userDefaults boolForKey:RUN_FAILURES_ONLY_KEY];
}



- (NSMutableDictionary *)passedTests
{
    if (passedTests == nil) {
        passedTests = [[self.userDefaults dictionaryForKey:PASSED_TESTS_KEY] mutableCopy];
        if (passedTests == nil) {
            passedTests = [NSMutableDictionary new];
        }
    }
    return passedTests;
}

- (BOOL)canClear
{
    return [passedTests count] && self.isRunFailuresOnly;
}

- (void)clearPassedTests
{
    [self.passedTests removeAllObjects];
}

- (void)addPassedTest:(NSString *)className methodName:(NSString *)methodName
{
    NSMutableArray *methods = [self.passedTests objectForKey:className];
    if (methods == nil) {
        methods = [NSMutableArray array];
        [self.passedTests setObject:methods forKey:className];
    }
    if (![methods containsObject:methodName]) {
        [methods addObject:methodName];
    }
}

- (BOOL)needsTest:(NSString *)className methodName:(NSString *)methodName
{
    if (self.isRunFailuresOnly) {
        if ([NSClassFromString(className) forceTestsAnyway]) {
            return YES;
        }
        NSMutableArray *methods = [self.passedTests objectForKey:className];
        return (methods && [methods containsObject:methodName]) ? NO : YES;
    } else {
        return YES;
    }
}



- (void)synchronize
{
    [self.userDefaults setObject:self.passedTests forKey:PASSED_TESTS_KEY];
}


@end
