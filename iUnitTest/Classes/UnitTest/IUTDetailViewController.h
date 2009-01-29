//
//  IUTDetailViewController.h
//  iUnitTest
//
//  Created by Katsuyoshi Ito on 09/01/22.
//  Copyright 2009 ITO SOFT DESIGN Inc. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface IUTDetailViewController : UIViewController {
 
    IBOutlet UITextView *textView;

    NSException *exception;

}

@property (retain) IBOutlet UITextView *textView;

@property (retain) NSException *exception;

@end
