//
//  IUTPreference.h
//  iUnitTestTest
//
//  Created by Katsuyoshi Ito on 09/02/26.
//  Copyright 2009 ITO SOFT DESIGN Inc. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface IUTPreference : NSObject {
    NSUserDefaults *userDefaults;
    NSMutableDictionary *passedTests;
}

+ (id)sharedPreference;

@property (retain, readonly) NSUserDefaults *userDefaults;

@property (readonly) BOOL isAutoRun;
@property (readonly) BOOL isRunFailuresOnly;

@property (retain, readonly) NSMutableDictionary *passedTests;

@property (readonly) BOOL canClear;

- (void)clearPassedTests;
- (void)addPassedTest:(NSString *)className methodName:(NSString *)methodName;
- (BOOL)needsTest:(NSString *)className methodName:(NSString *)methodName;

- (void)synchronize;

@end
