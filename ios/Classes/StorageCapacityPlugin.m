#import "StorageCapacityPlugin.h"
#if __has_include(<storage_capacity/storage_capacity-Swift.h>)
#import <storage_capacity/storage_capacity-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "storage_capacity-Swift.h"
#endif

@implementation StorageCapacityPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftStorageCapacityPlugin registerWithRegistrar:registrar];
}
@end
