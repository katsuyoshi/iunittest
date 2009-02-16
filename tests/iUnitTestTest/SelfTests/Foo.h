//
//  Foo.h
//  iUnitTestTest
//
//  Created by Katsuyoshi Ito on 09/02/15.
//  Copyright 2009 ITO SOFT DESIGN Inc. All rights reserved.
//

#import <Foundation/Foundation.h>


extern NSString * const FooDidChangeNotification;

@interface Foo : NSObject {

    int bar;
    int hoge;
    
    BOOL notified;
    
}

@property int bar;
@property int hoge;

- (void)fooDidChange;

@end
