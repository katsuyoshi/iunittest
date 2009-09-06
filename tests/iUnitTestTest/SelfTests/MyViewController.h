//
//  MyViewController.h
//  iUnitTestTest
//
//  Created by Katsuyoshi Ito on 09/09/04.
//  Copyright 2009 ITO SOFT DESIGN Inc. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MyViewController : UIViewController {

    UIBarButtonItem *preLeftBarButtonItem;
    
    BOOL saved;
    BOOL canceled;
}

@property (readonly) BOOL saved;
@property (readonly) BOOL canceled;

- (void)saveAction:(id)sender;
- (void)cancelAction:(id)sender;


@end
