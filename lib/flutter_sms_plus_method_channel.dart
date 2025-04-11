import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sms_plus/flutter_sms_plus_platform_interface.dart';


/// An implementation of [FlutterSMSPlusPlatform] that uses method channels.
class MethodChannelFlutterSMSPlus extends FlutterSMSPlusPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('sms_sender');


  @override
  Future<String?> sendSms({required List<String> numbers, required String message}) async {
    final result = await methodChannel.invokeMethod('sendSms', {
      'numbers': numbers,
      'message': message,
    });
    return result;
  }
}
