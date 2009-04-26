//
//  SourceCodeOpener.h
//  iUnitTestTest
//
//  Created by Katsuyoshi Ito on 09/04/18.
//  Copyright 2009 ITO SOFT DESIGN Inc. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface SourceCodeOpener : NSObject {

}

+ (void)openFile:(NSString *)filepath lineFrom:(int)from lineTo:(int)to;
+ (void)openFile:(NSString *)filepath line:(int)line;

@end
