//
//  IUTPreferenceTest.h
//  iUnitTestTest
//
//  Created by Katsuyoshi Ito on 09/02/26.
//  Copyright 2009 ITO SOFT DESIGN Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IUTTest.h"
#import "IUTPreference.h"



// Deprecated.
// It broke passedTests in preference.
// It makes hung up application.
// Then it was removed from project member.
@interface IUTPreferenceTest : IUTTest {

    IUTPreference *preference;
    
    NSDictionary *passedTestsSetting;
    BOOL runFailuresOnlySetting;
}

@property (retain) NSDictionary *passedTestsSetting;
@property BOOL runFailuresOnly;

@end
