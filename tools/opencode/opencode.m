#import <Foundation/Foundation.h>
#import "SourceCodeOpener.h"
#import "Server.h"

int main (int argc, const char * argv[]) {

    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    NSRunLoop * runLoop = [NSRunLoop currentRunLoop];

    Server *server = [Server new];
    NSError * error = nil;
    [server setType:@"_iunittest_opencode._tcp."];
    if (![server start:&error] ) {
        NSLog(@"Error starting server: %@", error);
    } else {
        NSLog(@"Starting server on port %d", [server port]);
    }

    [runLoop run];
    [server release];
    [pool drain];

    return 0;
}
