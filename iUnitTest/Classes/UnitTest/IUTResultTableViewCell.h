//
//  IUTResultTableViewCell.h
//  iUnitTest
//
//  Created by Katsuyoshi Ito on 09/01/17.
//  Copyright 2009 ITO SOFT DESIGN Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IUTAssertionInfo.h"


@interface IUTResultTableViewCell : UITableViewCell {

    UILabel *resultLabel;
    UIView *backgroundView;

    NSException *exception;
}


@property (retain, readonly) UILabel *resultLabel;
@property (retain, readonly) UIView *backgroundView;

@property (retain) NSException *exception;

@end
