import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'wakelock_partial_android_method_channel.dart';

abstract class WakelockPartialAndroidPlatform extends PlatformInterface {
  WakelockPartialAndroidPlatform() : super(token: _token);

  static final Object _token = Object();

  static WakelockPartialAndroidPlatform _instance = MethodChannelWakelockPartialAndroid();

  static WakelockPartialAndroidPlatform get instance => _instance;

  static set instance(WakelockPartialAndroidPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<void> acquire() {
    throw UnimplementedError('acquire() has not been implemented.');
  }

  Future<void> release() {
    throw UnimplementedError('release() has not been implemented.');
  }
}
