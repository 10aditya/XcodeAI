#import "../include/VCDLibraryFactory.h"
#import "VCDLibraryImpl.h"

@implementation CVCDLibraryFactory

#pragma mark - Singleton Implementation

+ (instancetype)sharedFactory {
    static CVCDLibraryFactory *sharedInstance = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        sharedInstance = [[super allocWithZone:NULL] init];
    });
    
    return sharedInstance;
}

+ (id)allocWithZone:(NSZone *)zone {
    return [self sharedFactory];
}

#pragma mark - Library Creation

- (VCDLibrary *)createVCDLibrary {
    return [[CVCDLibrary alloc] init];
}

@end
