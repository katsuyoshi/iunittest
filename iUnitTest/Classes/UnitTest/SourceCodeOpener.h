//
//  SourceCodeOpener.h
//  iUnitTestTest
//
//  Created by Katsuyoshi Ito on 09/04/26.
//  Copyright 2009 ITO SOFT DESIGN Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IUTAssertionInfo.h"


@interface SourceCodeOpener : NSObject {
    
    NSNetServiceBrowser *browser;
    NSMutableSet *services;
    NSNetService *targetService;
    NSMutableSet *resolvingServices;
    NSFileHandle *fileHandle;
}


@property (retain) NSNetService *targetService;
@property (retain) NSFileHandle *fileHandle;


#pragma mark -
#pragma mark NSNetServiceBrowser's delegate

- (void)netServiceBrowser:(NSNetServiceBrowser *)netServiceBrowser didFindService:(NSNetService *)netService moreComing:(BOOL)moreServicesComing;

- (void)netServiceBrowser:(NSNetServiceBrowser *)netServiceBrowser didRemoveService:(NSNetService *)netService moreComing:(BOOL)moreServicesComing;

 
#pragma mark -
#pragma mark NSNetService's delegate

- (void)netServiceDidResolveAddress:(NSNetService *)sender;



- (void)open:(IUTAssertionInfo *)info;


@end
