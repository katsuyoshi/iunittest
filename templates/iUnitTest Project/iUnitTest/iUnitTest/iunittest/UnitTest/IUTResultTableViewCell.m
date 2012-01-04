//
//  IUTResultTableViewCell.m
//  iUnitTest
//
//  Created by Katsuyoshi Ito on 09/01/17.
//  Copyright 2009 ITO SOFT DESIGN Inc. All rights reserved.
//

#import "IUTResultTableViewCell.h"
#import "IUTAssertion.h"
#import "IUTTestRunner.h"
#import "NSExceptionExtension.h"


@implementation IUTResultTableViewCell


@synthesize resultLabel, bgView;
@synthesize exception;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        resultLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        resultLabel.font = [UIFont fontWithName:resultLabel.font.fontName size:14];
        resultLabel.numberOfLines = 0;
        [self addSubview:resultLabel];
        
        bgView = [UIView new];
        [self addSubview:bgView];
        [self sendSubviewToBack:bgView]; 
        
    }
    return self;
}

- (void)setException:(NSException *)anException
{
    if (exception != anException) {
        [exception release];
        exception = [anException retain];

        IUTAssertionInfo *info = exception.assertionInfo;
        if (info) {
            self.resultLabel.backgroundColor = [exception color];
            self.resultLabel.text = info.reason;
        } else {
            self.resultLabel.backgroundColor = [IUTTestRunner errorColor];
            self.resultLabel.text = exception.reason;
        }
        self.bgView.backgroundColor = self.resultLabel.backgroundColor;
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {

    [super setSelected:selected animated:animated];
    self.resultLabel.textColor = (selected) ? [UIColor whiteColor] : [UIColor blackColor];
}

- (void)layoutSubviews {
    [super layoutSubviews];

    CGRect rect = self.bounds;
    rect.size.height -= 1;
    bgView.frame = rect;
    
    CGRect baseRect = CGRectInset(self.contentView.bounds, 10, 10);
    rect = baseRect;

    resultLabel.frame = rect;
}

- (void)dealloc {
    [exception release];
    [resultLabel release];
    [bgView release];
    [super dealloc];
}


@end
