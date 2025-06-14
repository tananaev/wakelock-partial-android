package com.tananaev.wakelock_partial_android

import android.annotation.SuppressLint
import android.content.Context
import android.os.PowerManager
import android.util.Log
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

class WakelockPartialAndroidPlugin: FlutterPlugin, MethodCallHandler {
  private lateinit var channel: MethodChannel
  private lateinit var wakelock: PowerManager.WakeLock

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "wakelock_partial_android")
    channel.setMethodCallHandler(this)
    val context = flutterPluginBinding.applicationContext
    val powerManager = context.getSystemService(Context.POWER_SERVICE) as PowerManager
    wakelock = powerManager.newWakeLock(
      PowerManager.PARTIAL_WAKE_LOCK,
      "wakelock_partial_android:${hashCode()}",
    )
    wakelock.setReferenceCounted(false)
  }

  @SuppressLint("WakelockTimeout")
  override fun onMethodCall(call: MethodCall, result: Result) {
    when (call.method) {
      "acquire" -> {
        wakelock.acquire()
        Log.i("Wakelock", "Wakelock acquired")
        result.success(true)
      }
      "release" -> {
        wakelock.release()
        Log.i("Wakelock", "Wakelock released")
        result.success(true)
      }
      else -> result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    if (wakelock.isHeld) {
      wakelock.release()
      Log.i("Wakelock", "Wakelock released on detach")
    }
    channel.setMethodCallHandler(null)
  }
}
