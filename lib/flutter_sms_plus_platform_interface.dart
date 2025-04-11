import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_sms_plus_method_channel.dart';

abstract class FlutterSMSPlusPlatform extends PlatformInterface {
  /// Constructs a SmsSenderPlatform.
  FlutterSMSPlusPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterSMSPlusPlatform _instance = MethodChannelFlutterSMSPlus();

  /// The default instance of [FlutterSMSPlusPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterSMSPlus].
  static FlutterSMSPlusPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterSMSPlusPlatform] when
  /// they register themselves.
  static set instance(FlutterSMSPlusPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }


  Future<String?> sendSms({required List<String> numbers, required String message});
}
