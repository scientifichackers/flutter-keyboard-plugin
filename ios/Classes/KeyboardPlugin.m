#import "KeyboardPlugin.h"
#import <keyboard/keyboard-Swift.h>

@implementation KeyboardPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftKeyboardPlugin registerWithRegistrar:registrar];
}
@end
