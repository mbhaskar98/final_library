#import "FinalLibrary.h"

#include <string>
#include <algorithm>

@implementation FinalLibrary
RCT_EXPORT_MODULE()

- (instancetype)init
{
    self = [super init];
    if (self) {
        bool isNewArch = false;
#ifdef RCT_NEW_ARCH_ENABLED
        isNewArch = true;
#endif
        NSLog(@"Is new Arch?:%d", isNewArch);
    }
    return self;
}

// Example method
// See // https://reactnative.dev/docs/native-modules-ios
RCT_EXPORT_METHOD(multiply:(double)a
                  b:(double)b
                  resolve:(RCTPromiseResolveBlock)resolve
                  reject:(RCTPromiseRejectBlock)reject)
{
    NSNumber *result = @(a * b);

    resolve(result);
}

RCT_EXPORT_METHOD(revertString:(NSString*)str
                  resolve:(RCTPromiseResolveBlock)resolve
                  reject:(RCTPromiseRejectBlock)reject)
{
    std::string originalString = str.UTF8String;
    NSLog(@"Original String %@", str);
    std::reverse(originalString.begin(), originalString.end());
    str = [NSString stringWithFormat:@"%s", originalString.c_str()];
    resolve(str);
}

// Don't compile this code when we build for the old architecture.
#ifdef RCT_NEW_ARCH_ENABLED
- (std::shared_ptr<facebook::react::TurboModule>)getTurboModule:
    (const facebook::react::ObjCTurboModule::InitParams &)params
{
    return std::make_shared<facebook::react::NativeFinalLibrarySpecJSI>(params);
}
#endif

@end
