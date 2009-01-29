//
//  PrefecturesAppDelegate.h
//  Prefectures
//
//  Created by Katsuyoshi Ito on 09/01/26.
//  Copyright ITO SOFT DESIGN Inc 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PrefecturesAppDelegate : NSObject <UIApplicationDelegate> {
    
    UIWindow *window;
    UINavigationController *navigationController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

@end

