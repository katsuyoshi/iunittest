//
//  IUTTestRunner.h
//  iUnitTest
//
//  Created by Katsuyoshi Ito on 09/01/16.
//  Copyright 2009 ITO SOFT DESIGN Inc. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface IUTTestRunner : NSObject {

    NSMutableArray *sites;
    
    NSMutableArray *tests;
    NSMutableArray *passes;
    NSMutableArray *fails;
    NSMutableArray *errors;
    
    NSException *exception;

    BOOL stopRequest;
    
    NSTimeInterval delay;
}

@property (retain, readonly) NSMutableArray *sites;
    
@property (retain, readonly) NSMutableArray *tests;
@property (retain, readonly) NSMutableArray *passes;
@property (retain, readonly) NSMutableArray *fails;
@property (retain, readonly) NSMutableArray *errors;

@property (readonly) int badgeNumber;

@property (retain) NSException *exception;

@property (assign, readonly) NSString *result;

@property (readonly) int assertedCount;

@property (readonly) BOOL isPassed;
@property (readonly) BOOL hasErrors;
@property (readonly) BOOL hasFailures;

@property (assign, readonly) UIColor *successColor;
@property (assign, readonly) UIColor *failureColor;
@property (assign, readonly) UIColor *failureColor2;
@property (assign, readonly) UIColor *errorColor;
@property (assign, readonly) UIColor *idleColor;
@property (assign, readonly) UIColor *backgroundColor;


+ (UIColor *)successColor;
+ (UIColor *)failureColor;
+ (UIColor *)failureColor2;
+ (UIColor *)errorColor;
+ (UIColor *)idleColor;


- (void)run:(id)sender;
- (void)stop:(id)sender;


@end
