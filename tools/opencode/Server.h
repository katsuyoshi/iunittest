//
//  Server.h
//  opencode
//
//  Created by Katsuyoshi Ito on 09/04/26.
//  Copyright 2009 ITO SOFT DESIGN Inc. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "TCPServer.h"


@interface Server : TCPServer {
    NSMutableDictionary *connectionDict;
    NSMutableSet *inputStreams;
}

- (id)init;

- (void)handleNewConnectionFromAddress:(NSData *)address inputStream:(NSInputStream *)inputStream outputStream:(NSOutputStream *)outputStream;

@end
