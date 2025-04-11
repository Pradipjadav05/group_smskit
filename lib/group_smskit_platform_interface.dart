import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'group_smskit_method_channel.dart';

abstract class GroupSMSKitPlatform extends PlatformInterface {
  /// Constructs a SmsSenderPlatform.
  GroupSMSKitPlatform() : super(token: _token);

  static final Object _token = Object();

  static GroupSMSKitPlatform _instance = MethodChannelGroupSMSKit();

  /// The default instance of [GroupSMSKitPlatform] to use.
  ///
  /// Defaults to [MethodChannelGroupSMSKit].
  static GroupSMSKitPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [GroupSMSKitPlatform] when
  /// they register themselves.
  static set instance(GroupSMSKitPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> sendSms(
      {required List<String> numbers, required String message});
}
