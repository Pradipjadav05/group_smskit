package com.example.sms_sender

import androidx.annotation.NonNull
import android.telephony.SmsManager
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** SmsSenderPlugin */
class SmsSenderPlugin: FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "sms_sender")
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    if (call.method == "sendSms") {
      val numbers = call.argument<List<String>>("numbers")
      val message = call.argument<String>("message")
      try {
        val smsManager = SmsManager.getDefault()
        numbers?.forEach { number ->
          smsManager.sendTextMessage(number, null, message, null, null)
        }
        result.success("SMS sent successfully.")
      } catch (e: Exception) {
        result.error("SMS_ERROR", "Failed to send SMS: ${e.message}", null)
      }
    } else {
      result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
