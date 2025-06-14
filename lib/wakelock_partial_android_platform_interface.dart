import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'wakelock_partial_android_method_channel.dart';

abstract class WakelockPartialAndroidPlatform extends PlatformInterface {
  /// Constructs a WakelockPartialAndroidPlatform.
  WakelockPartialAndroidPlatform() : super(token: _token);

  static final Object _token = Object();

  static WakelockPartialAndroidPlatform _instance = MethodChannelWakelockPartialAndroid();

  /// The default instance of [WakelockPartialAndroidPlatform] to use.
  ///
  /// Defaults to [MethodChannelWakelockPartialAndroid].
  static WakelockPartialAndroidPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [WakelockPartialAndroidPlatform] when
  /// they register themselves.
  static set instance(WakelockPartialAndroidPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
