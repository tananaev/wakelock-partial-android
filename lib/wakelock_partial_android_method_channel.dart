import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'wakelock_partial_android_platform_interface.dart';

class MethodChannelWakelockPartialAndroid extends WakelockPartialAndroidPlatform {
  @visibleForTesting
  final methodChannel = const MethodChannel('wakelock_partial_android');

  @override
  Future<void> acquire() async {
    await methodChannel.invokeMethod('acquire');
  }

  @override
  Future<void> release() async {
    await methodChannel.invokeMethod('release');
  }
}
