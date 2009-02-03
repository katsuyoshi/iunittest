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


@implementation IUTResultTableViewCell


@synthesize resultLabel, backgroundView;
@synthesize exception;

- (id)initWithFrame:(CGRect)frame reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithFrame:frame reuseIdentifier:reuseIdentifier]) {

        resultLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        resultLabel.font = [UIFont fontWithName:resultLabel.font.fontName size:14];
        resultLabel.numberOfLines = 0;
        [self addSubview:resultLabel];
        
        backgroundView = [UIView new];
        [self addSubview:backgroundView];
        [self sendSubviewToBack:backgroundView]; 
        
    }
    return self;
}

- (void)setException:(NSException *)anException
{
    if (exception != anException) {
        [exception release];
        exception = [anException retain];

        IUTAssertionInfo *info =[IUTAssertion assertionInfoForException:exception];
        if (info) {
            self.resultLabel.backgroundColor = ([exception.name isEqualToString:IUTAssertionExceptionName]) ? [IUTTestRunner failureColor] : [IUTTestRunner errorColor];
            self.resultLabel.text = info.reason;
        } else {
            self.resultLabel.backgroundColor = [IUTTestRunner errorColor];
            self.resultLabel.text = exception.reason;
        }
        self.backgroundView.backgroundColor = self.resultLabel.backgroundColor;
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
    backgroundView.frame = rect;
    
    CGRect baseRect = CGRectInset(self.contentView.bounds, 10, 10);
    rect = baseRect;

    resultLabel.frame = rect;
}

- (void)dealloc {
    [exception release];
    [resultLabel release];
    [backgroundView release];
    [super dealloc];
}


@end
