import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'wakelock_partial_android_platform_interface.dart';

/// An implementation of [WakelockPartialAndroidPlatform] that uses method channels.
class MethodChannelWakelockPartialAndroid extends WakelockPartialAndroidPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('wakelock_partial_android');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
