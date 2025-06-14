import 'package:flutter/material.dart';

import 'package:wakelock_partial_android/wakelock_partial_android.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await WakelockPartialAndroid.acquire();
  await WakelockPartialAndroid.release();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return SizedBox.shrink();
  }
}
