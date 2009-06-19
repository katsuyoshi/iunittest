//
//  NSExceptionExtension.h
//  iUnitTest
//
//  Created by Katsuyoshi Ito on 09/05/14.
//  Copyright 2009 ITO SOFT DESIGN Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IUTAssertionInfo.h"


@interface NSException(IUTAssertionInfo)
@property (assign, readonly) IUTAssertionInfo *assertionInfo;
@property (readonly) BOOL isFailure;
@property (readonly) BOOL isError;
@end

@interface NSException(IUTResultTableViewCell)
- (UIColor *)color;
@end
