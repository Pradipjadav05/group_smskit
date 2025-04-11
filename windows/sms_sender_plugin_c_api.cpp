#include "include/sms_sender/sms_sender_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "sms_sender_plugin.h"

void SmsSenderPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  sms_sender::SmsSenderPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
