//
//  AssertionInfo.h
//  iUnitTest
//
//  Created by Katsuyoshi Ito on 09/01/16.
//  Copyright 2009 ITO SOFT DESIGN Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SourceCodeOpener.h"


#define IUTASSERTION_INF(m)  [IUTAssertionInfo assertionInfoWithClass:[self class] selector:_cmd message:m filePath:[[[NSString alloc] initWithCString:__FILE__] autorelease] line:__LINE__]

@interface IUTAssertionInfo : NSObject {

    NSString *className;
    NSString *methodName;
    NSString *message;
    NSString *filePath;
    NSInteger line;

    id expected;
    id actual;
    id delta;
    
    BOOL negativeCase;
}

@property (retain, readonly) NSString *className;
@property (retain, readonly) NSString *methodName;
@property (retain, readonly) NSString *message;
@property (assign, readonly) NSString *reason;
@property (retain, readonly) NSString *filePath;
@property (assign, readonly) NSString *fileName;
@property NSInteger line;

@property (retain) id expected;
@property (retain) id actual;
@property (retain) id delta;

@property BOOL negativeCase;

+ (id)assertionInfoWithClass:(Class)klass selector:(SEL)selector message:(NSString *)message filePath:(NSString *)path line:(NSInteger)line;

- (id)initWithWithClass:(Class)klass selector:(SEL)selector message:(NSString *)message filePath:(NSString *)path line:(NSInteger)line;


@end


#if TARGET_IPHONE_SIMULATOR

@interface SourceCodeOpener(IUTAssertionInfo)

- (void)open:(IUTAssertionInfo *)info;

@end

#endif
