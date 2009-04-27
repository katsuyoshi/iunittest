//
//  SourceCodeOpener.m
//  iUnitTestTest
//
//  Created by Katsuyoshi Ito on 09/04/18.
//  Copyright 2009 ITO SOFT DESIGN Inc. All rights reserved.
//

#import "SourceCodeOpener.h"

@implementation SourceCodeOpener


+ (void)openFile:(NSString *)filepath lineFrom:(int)from lineTo:(int)to
{
    NSString *script = 
@"tell application \"Xcode\" to activate\n"
"   tell application \"Xcode\"\n"
"       set doc to open POSIX path of \"%@\"\n"
"       tell doc\n set selection to paragraphs %d thru %d\n"
"   end tell\n"
"end tell";
    NSString *source = [NSString stringWithFormat:script, filepath, from, to];

    NSAppleScript *appleScript = [[[NSAppleScript alloc] initWithSource:source] autorelease];
    [appleScript executeAndReturnError:nil];
}

+ (void)openFile:(NSString *)filepath line:(int)line
{
// NSLog(@"{ path = %@; line = %d }", filepath, line);
    [self openFile:filepath lineFrom:line lineTo:line];
}

@end
