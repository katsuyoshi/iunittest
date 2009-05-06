//
//  SourceCodeOpener.m
//  iUnitTestTest
//
//  Created by Katsuyoshi Ito on 09/04/26.
//  Copyright 2009 ITO SOFT DESIGN Inc. All rights reserved.
//


#if TARGET_IPHONE_SIMULATOR


#import "SourceCodeOpener.h"
#import <sys/types.h>
#import <sys/socket.h>
#import <netinet/in.h>
#import <arpa/inet.h>
#import <unistd.h>


@interface SourceCodeOpener(_private)
- (BOOL)openWithSocketAddress:(struct sockaddr *)socketAddress;
- (void)close;
- (BOOL)isOpend;
@end


@implementation SourceCodeOpener

@synthesize targetService, fileHandle;

+ (id)sourceCodeOpener
{
    static id opener = nil;
    if (opener == nil) {
        opener = [self new];
    }
    return opener;
}



- (id)init
{
    self = [super init];
    if (self) {
        browser = [NSNetServiceBrowser new];
        services = [NSMutableSet new];
        resolvingServices = [NSMutableSet new];
        [browser setDelegate:self];
        [browser searchForServicesOfType:@"_iunittest_opencode._tcp." inDomain:@""];
    }
    return self;
}
 
- (void)dealloc
{
    [self close];
    for (NSNetService *service in [resolvingServices allObjects]) {
        [service stop];
    }
    [resolvingServices release];
    [services release];
    [super dealloc];
}

#pragma mark -
#pragma mark open/close

- (BOOL)openWithSocketAddress:(struct sockaddr *)socketAddress
{
    int socket_fd = socket(AF_INET, SOCK_STREAM, 0);
    if (socket_fd != -1) {
        self.fileHandle = [[NSFileHandle alloc] initWithFileDescriptor:socket_fd closeOnDealloc:YES];
        int len = sizeof(*socketAddress);
        int result = connect(socket_fd, socketAddress, len);
        if (result != -1) {
            return YES;
        } else {
            [self close];
        }
    } else {
        [self close];
    }
    return NO;
}

- (void)close
{
    if (self.fileHandle) {
        self.fileHandle = nil;
        self.targetService = nil;
    }
}

- (BOOL)isOpend
{
    return self.fileHandle ? YES : NO;
}


#pragma mark -
#pragma mark NSNetServiceBrowser's delegate

- (void)netServiceBrowser:(NSNetServiceBrowser *)netServiceBrowser didFindService:(NSNetService *)netService moreComing:(BOOL)moreServicesComing
{
    [services addObject:netService];
    [resolvingServices addObject:netService];
    [netService setDelegate:self];
    [netService resolveWithTimeout:1.0];
}

- (void)netServiceBrowser:(NSNetServiceBrowser *)netServiceBrowser didRemoveService:(NSNetService *)netService moreComing:(BOOL)moreServicesComing
{
    if ([resolvingServices containsObject:netService]) {
        [netService stop];
        [resolvingServices removeObject:netService];
    }
    [services removeObject:netService];
}

#pragma mark -
#pragma mark NSNetService's delegate



- (void)netServiceDidResolveAddress:(NSNetService *)sender
{
    [resolvingServices removeObject:sender];
    
    if (![self isOpend]) {
        NSString *hostName = [NSString stringWithFormat:@"%@.", [[NSProcessInfo processInfo] hostName]];
        if ([[sender hostName] isEqualToString:hostName]) {
            
            if ([[sender addresses] count] > 0) {
                NSData * address;
                struct sockaddr *socketAddress;
                int i;
                BOOL gotAddress = NO;

                for (i = 0; i < [[sender addresses] count]; i++) {
                    address = [[sender addresses] objectAtIndex:i];
                    socketAddress = (struct sockaddr *)[address bytes];

                    if (socketAddress->sa_family == AF_INET) {
                        gotAddress = YES;
                        break;
                    }
                }
                if (gotAddress) {
                    if ([self openWithSocketAddress:socketAddress]) {
                        self.targetService = sender;
                    }
                }
            }
        }
    }
}



- (void)open:(NSString *)filePath line:(NSInteger)line 
{
    if ([self isOpend]) {
        if (line) {
            NSString *cmd = [NSString stringWithFormat:@"%@:%d\n", filePath, line];
            [self.fileHandle writeData:[cmd dataUsingEncoding:NSUTF8StringEncoding]];
        }
    }
}

@end

#endif
