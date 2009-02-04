/*
 *  IUTLog.h
 *  iUnitTestTest
 *
 *  Created by Katsuyoshi Ito on 09/02/05.
 *  Copyright 2009 ITO SOFT DESIGN Inc. All rights reserved.
 *
 */

#if TARGET_IPHONE_SIMULATOR
#define IUTLog(format, ...)  NSLog(format, ##__VA_ARGS__)
#else
#define IUTLog(format, ...)
#endif
