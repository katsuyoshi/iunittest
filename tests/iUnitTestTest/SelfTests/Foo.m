//
//  Foo.m
//  iUnitTestTest
//
//  Created by Katsuyoshi Ito on 09/02/15.
//  Copyright 2009 ITO SOFT DESIGN Inc. All rights reserved.
//

#import "Foo.h"


NSString * const FooDidChangeNotification = @"FooDidChangeNotification";

@interface Foo(_private)
- (void)beginFooDidChange;
@end

@implementation Foo

@synthesize bar, hoge;

- (void)setBar:(int)value
{
    if (bar != value) {
        bar = value;
        [self beginFooDidChange];
    }
}

- (void)setHoge:(int)value
{
    if (hoge != value) {
        hoge = value;
        [self beginFooDidChange];
    }
}

- (void)beginFooDidChange
{
    if (!notified) {
        notified = YES;
        [self performSelectorOnMainThread:@selector(fooDidChange) withObject:nil waitUntilDone:NO];
    }
}

- (void)fooDidChange
{
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center postNotificationName:FooDidChangeNotification object:self userInfo:nil];
    notified = NO;
}


@end
