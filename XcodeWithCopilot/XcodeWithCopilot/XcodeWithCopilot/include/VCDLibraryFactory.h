#import <Foundation/Foundation.h>
#import "VCDLibrary.h"

// Singleton factory class for creating VCD library instances
@interface CVCDLibraryFactory : NSObject

// Singleton access
+ (instancetype)sharedFactory;

// Create library instance
- (VCDLibrary *)createVCDLibrary;

// Prevent direct initialization
- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;
- (id)copy NS_UNAVAILABLE;
- (id)mutableCopy NS_UNAVAILABLE;

@end
