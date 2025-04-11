#ifndef FLUTTER_PLUGIN_SMS_SENDER_PLUGIN_H_
#define FLUTTER_PLUGIN_SMS_SENDER_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace sms_sender {

class SmsSenderPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  SmsSenderPlugin();

  virtual ~SmsSenderPlugin();

  // Disallow copy and assign.
  SmsSenderPlugin(const SmsSenderPlugin&) = delete;
  SmsSenderPlugin& operator=(const SmsSenderPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace sms_sender

#endif  // FLUTTER_PLUGIN_SMS_SENDER_PLUGIN_H_
