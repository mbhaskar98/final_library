
#ifdef RCT_NEW_ARCH_ENABLED
#import "RNFinalLibrarySpec.h"

@interface FinalLibrary : NSObject <NativeFinalLibrarySpec>
#else
#import <React/RCTBridgeModule.h>

@interface FinalLibrary : NSObject <RCTBridgeModule>
#endif

@end
