//
//  PXISARC.h
//  paixiu
//
//  Created by Static Ga on 12-10-15.
//  Copyright (c) 2012年 PaiXiu. All rights reserved.
//

#ifndef paixiu_PXISARC_h
#define paixiu_PXISARC_h

#ifndef PX_STRONG
#if __has_feature(objc_arc)
#define PX_STRONG strong
#else
#define PX_STRONG retain
#endif
#endif

#ifndef PX_WEAK
#if __has_feature(objc_arc_weak)
#define PX_WEAK weak
#elif __has_feature(objc_arc)
#define PX_WEAK unsafe_unretained
#else
#define PX_WEAK assign
#endif
#endif

#if __has_feature(objc_arc)
#define PX_AUTORELEASE(exp) exp
#define PX_RELEASE(exp) exp
#define PX_RETAIN(exp) exp
#else
#define PX_AUTORELEASE(exp) [exp autorelease]
#define PX_RELEASE(exp) [exp release]
#define PX_RETAIN(exp) [exp retain]
#endif

#endif
