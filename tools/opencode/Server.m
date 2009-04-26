//
//  Server.m
//  opencode
//
//  Created by Katsuyoshi Ito on 09/04/26.
//  Copyright 2009 ITO SOFT DESIGN Inc. All rights reserved.
//

#import "Server.h"
#import "SourceCodeOpener.h"

#define ReceivedStringKey @"ReceivedString"
#define InputStreamKey(s)  [s description]


@interface Server(_private)
- (void)registInputStream:(NSInputStream *)inputStream;
- (void)unregistInputStreamAndTreminate:(NSInputStream *)inputStream;
- (void)receivedAtInputStream:(NSInputStream *)inputStream;
@end

@implementation Server

- (id)init
{
    self = [super init];
    if (self) {
        connectionDict = [NSMutableDictionary new];
        inputStreams = [NSMutableSet new];
    }
    return self;
}

- (void)dealloc
{
    for (NSInputStream *inputStream in [inputStreams allObjects]) {
        [self unregistInputStreamAndTreminate:inputStream];
    }
    [connectionDict release];
    [inputStreams release];
    [super dealloc];
}

- (void)registInputStream:(NSInputStream *)inputStream
{
    NSMutableDictionary *context = [NSMutableDictionary dictionaryWithObject:[NSMutableString string] forKey:ReceivedStringKey];
    
    [connectionDict setObject:context forKey:InputStreamKey(inputStream)];
    [inputStreams addObject:inputStream];
    
    [inputStream setDelegate:self];
    [inputStream scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    [inputStream open];
}

- (void)unregistInputStreamAndTreminate:(NSInputStream *)inputStream
{
    [inputStream close];
    [inputStream removeFromRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    [inputStream setDelegate:nil];
    
    [connectionDict removeObjectForKey:InputStreamKey(inputStream)];
    [inputStreams removeObject:inputStream];
}

- (void)handleNewConnectionFromAddress:(NSData *)address inputStream:(NSInputStream *)inputStream outputStream:(NSOutputStream *)outputStream;
{
    [self registInputStream:inputStream];
}

- (void)receivedAtInputStream:(NSInputStream *)inputStream
{
    uint8_t buffer[2048];
    int len = [inputStream read:(uint8_t *)buffer maxLength:2048];
    if (len > 0) {
        NSMutableDictionary *context = [connectionDict objectForKey:InputStreamKey(inputStream)];
        NSMutableString *receivedString = [context objectForKey:ReceivedStringKey];
        NSString *str = [[[NSString alloc] initWithBytes:buffer length:len encoding:NSUTF8StringEncoding] autorelease];
        if (str) {
            [receivedString appendString:str];
            NSRange range = [receivedString lineRangeForRange:NSMakeRange(0, [receivedString length])];
            if (range.length) {
                str = [receivedString substringWithRange:range];
                [receivedString replaceCharactersInRange:range withString:@""];
                NSArray *elements = [str componentsSeparatedByString:@":"];
                if ([elements count] == 2) {
                    int line = [[elements objectAtIndex:1] intValue];
                    if (line) {
                        [SourceCodeOpener openFile:[elements objectAtIndex:0] line:line];
                    }
                }
            }
            [context setObject:receivedString forKey:ReceivedStringKey];
        }
    }
}

- (void)stream:(NSStream *)aStream handleEvent:(NSStreamEvent)streamEvent {
    NSInputStream *inputStream;
    switch(streamEvent) {
        case NSStreamEventHasBytesAvailable:
            [self receivedAtInputStream:(NSInputStream *)aStream];
            break;
        case NSStreamEventEndEncountered:
            inputStream = (NSInputStream *)aStream;
            [self unregistInputStreamAndTreminate:inputStream];
            break;
        default:
            break;
    }
}

@end
