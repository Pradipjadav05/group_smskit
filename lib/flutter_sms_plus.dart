
import 'package:flutter_sms_plus/flutter_sms_plus_platform_interface.dart';

class FlutterSMSPlus {
  static Future<String?> sendSms({
    required List<String> numbers,
    required String message,
  }) {
    return FlutterSMSPlusPlatform.instance.sendSms(
      numbers: numbers,
      message: message,
    );
  }
}
