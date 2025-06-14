
import 'wakelock_partial_android_platform_interface.dart';

class WakelockPartialAndroid {
  static Future<void> acquire() {
    return WakelockPartialAndroidPlatform.instance.acquire();
  }

  static Future<void> release() {
    return WakelockPartialAndroidPlatform.instance.release();
  }
}
