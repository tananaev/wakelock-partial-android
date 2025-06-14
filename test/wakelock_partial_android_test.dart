import 'package:flutter_test/flutter_test.dart';
import 'package:wakelock_partial_android/wakelock_partial_android.dart';
import 'package:wakelock_partial_android/wakelock_partial_android_platform_interface.dart';
import 'package:wakelock_partial_android/wakelock_partial_android_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockWakelockPartialAndroidPlatform
    with MockPlatformInterfaceMixin
    implements WakelockPartialAndroidPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final WakelockPartialAndroidPlatform initialPlatform = WakelockPartialAndroidPlatform.instance;

  test('$MethodChannelWakelockPartialAndroid is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelWakelockPartialAndroid>());
  });

  test('getPlatformVersion', () async {
    WakelockPartialAndroid wakelockPartialAndroidPlugin = WakelockPartialAndroid();
    MockWakelockPartialAndroidPlatform fakePlatform = MockWakelockPartialAndroidPlatform();
    WakelockPartialAndroidPlatform.instance = fakePlatform;

    expect(await wakelockPartialAndroidPlugin.getPlatformVersion(), '42');
  });
}
