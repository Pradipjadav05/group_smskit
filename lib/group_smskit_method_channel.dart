import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:group_smskit/group_smskit_platform_interface.dart';

/// An implementation of [GroupSMSKitPlatform] that uses method channels.
class MethodChannelGroupSMSKit extends GroupSMSKitPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('sms_sender');

  @override
  Future<String?> sendSms(
      {required List<String> numbers, required String message}) async {
    final result = await methodChannel.invokeMethod('sendSms', {
      'numbers': numbers,
      'message': message,
    });
    return result;
  }
}
