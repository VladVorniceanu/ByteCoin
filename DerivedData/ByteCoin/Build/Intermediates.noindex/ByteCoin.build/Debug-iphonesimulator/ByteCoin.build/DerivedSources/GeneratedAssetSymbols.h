#import <Foundation/Foundation.h>

#if __has_attribute(swift_private)
#define AC_SWIFT_PRIVATE __attribute__((swift_private))
#else
#define AC_SWIFT_PRIVATE
#endif

/// The resource bundle ID.
static NSString * const ACBundleID AC_SWIFT_PRIVATE = @"co.appbrewery.ByteCoin";

/// The "Background Color" asset catalog color resource.
static NSString * const ACColorNameBackgroundColor AC_SWIFT_PRIVATE = @"Background Color";

/// The "Icon Color" asset catalog color resource.
static NSString * const ACColorNameIconColor AC_SWIFT_PRIVATE = @"Icon Color";

/// The "Title Color" asset catalog color resource.
static NSString * const ACColorNameTitleColor AC_SWIFT_PRIVATE = @"Title Color";

#undef AC_SWIFT_PRIVATE