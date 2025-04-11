//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <flutter_sms_plus/sms_sender_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) flutter_sms_plus_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "SmsSenderPlugin");
  sms_sender_plugin_register_with_registrar(flutter_sms_plus_registrar);
}
