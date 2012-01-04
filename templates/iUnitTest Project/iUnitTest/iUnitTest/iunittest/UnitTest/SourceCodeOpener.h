//
//  SourceCodeOpener.h
//  iUnitTestTest
//
//  Created by Katsuyoshi Ito on 09/04/26.
//  Copyright 2009 ITO SOFT DESIGN Inc. All rights reserved.
//

#import <Foundation/Foundation.h>


#if TARGET_IPHONE_SIMULATOR

#define SOURCE_CODE_OPENER_START()      [SourceCodeOpener sourceCodeOpener]
#define SOURCE_CODE_OPENER_OPEN_HERE()  [[SourceCodeOpener sourceCodeOpener] open:[NSString stringWithFormat:@"%s", __FILE__] line:__LINE__]

#else

#define SOURCE_CODE_OPENER_START()      
#define SOURCE_CODE_OPENER_OPEN_HERE()  

#endif



#if TARGET_IPHONE_SIMULATOR

@interface SourceCodeOpener : NSObject <NSNetServiceDelegate, NSNetServiceBrowserDelegate> {
    
    NSNetServiceBrowser *browser;
    NSMutableSet *services;
    NSNetService *targetService;
    NSMutableSet *resolvingServices;
    NSFileHandle *fileHandle;
}


@property (retain) NSNetService *targetService;
@property (retain) NSFileHandle *fileHandle;


+ (id)sourceCodeOpener;


#pragma mark -
#pragma mark NSNetServiceBrowser's delegate

- (void)netServiceBrowser:(NSNetServiceBrowser *)netServiceBrowser didFindService:(NSNetService *)netService moreComing:(BOOL)moreServicesComing;

- (void)netServiceBrowser:(NSNetServiceBrowser *)netServiceBrowser didRemoveService:(NSNetService *)netService moreComing:(BOOL)moreServicesComing;

 
#pragma mark -
#pragma mark NSNetService's delegate

- (void)netServiceDidResolveAddress:(NSNetService *)sender;



- (void)open:(NSString *)filePath line:(NSInteger)line;


@end

#endif
