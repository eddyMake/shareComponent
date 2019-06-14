#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "ShareConfiguration.h"
#import "ShareItem.h"
#import "ShareManager.h"
#import "ShareView.h"

FOUNDATION_EXPORT double ShareComponentVersionNumber;
FOUNDATION_EXPORT const unsigned char ShareComponentVersionString[];

