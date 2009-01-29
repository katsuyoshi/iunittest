//
//  AssertionInfo.m
//  iUnitTest
//
//  Created by Katsuyoshi Ito on 09/01/16.
//  Copyright 2009 ITO SOFT DESIGN Inc. All rights reserved.
//

#import "IUTAssertionInfo.h"


@implementation IUTAssertionInfo

@synthesize className, methodName, message, filePath, line;
@synthesize expected, actual, delta;


+ (id)assertionInfoWithClass:(Class)klass selector:(SEL)selector message:(NSString *)message filePath:(NSString *)path line:(NSInteger)line
{
    return [[[self alloc] initWithWithClass:klass selector:selector message:message filePath:path line:line] autorelease];
}


- (id)initWithWithClass:(Class)klass selector:(SEL)aSelector message:(NSString *)aMessage filePath:(NSString *)path line:(NSInteger)aLine
{
    self = [super init];
    if (self) {
        className = [NSStringFromClass(klass) retain];
        methodName = [NSStringFromSelector(aSelector) retain];
        message = [aMessage retain];
        filePath = [path retain];
        line = aLine;
    }
    return self;
}


- (NSString *)fileName
{
    if (filePath) {
        return [filePath lastPathComponent];
    }
    return nil;
}

- (NSString *)message
{
    if (message) {
        return message;
    } else {
        if (self.delta) {
            return [NSString stringWithFormat:@"expected:%@ but was:%@ delta:%@", self.expected, self.actual, self.delta];
        } else {
            return [NSString stringWithFormat:@"expected:%@ but was:%@", self.expected, self.actual];
        }
    }
}

- (NSString *)reason
{
    if (self.line > 0) {
        return [NSString stringWithFormat:@"%@:%d\n-[%@ %@]\n%@", self.fileName, self.line, self.className, self.methodName, self.message];
    } else {
        return [NSString stringWithFormat:@"maybe %@\n-[%@ %@]\n%@", self.fileName, self.className, self.methodName, self.message];
    }
}

- (void)dealloc
{
    [className release];
    [methodName release];
    [message release];
    [filePath release];
    [expected release];
    [actual release];
    [delta release];
    [super dealloc];
}


@end
