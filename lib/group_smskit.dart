import 'package:group_smskit/group_smskit_platform_interface.dart';

class GroupSMSKit {
  static Future<String?> sendSms({
    required List<String> numbers,
    required String message,
  }) {
    return GroupSMSKitPlatform.instance.sendSms(
      numbers: numbers,
      message: message,
    );
  }
}
