
import 'wakelock_partial_android_platform_interface.dart';

class WakelockPartialAndroid {
  Future<String?> getPlatformVersion() {
    return WakelockPartialAndroidPlatform.instance.getPlatformVersion();
  }
}
