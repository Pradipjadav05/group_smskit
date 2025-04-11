
import 'sms_sender_platform_interface.dart';

class SmsSender {
  static Future<String?> sendSms({
    required List<String> numbers,
    required String message,
  }) {
    return SmsSenderPlatform.instance.sendSms(
      numbers: numbers,
      message: message,
    );
  }
}
