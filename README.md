
# sms_sender

A Flutter plugin to send SMS messages from Android and iOS devices using native platform code.

This plugin enables developers to send text messages to one or multiple recipients directly from a Flutter application using platform channels.

---

## ✨ Features

- ✅ Send SMS messages from Android using `SmsManager`.
- ✅ Open native SMS composer on iOS using `MFMessageComposeViewController`.
- ✅ Supports multiple recipients.
- ✅ Clean method channel-based implementation.

---

## 🔧 Installation

Add the dependency in your `pubspec.yaml`:


```dart
dependencies:
  sms_sender:

```

---

## 🚀 Usage

### Dart Example

```dart
import 'package:sms_sender/sms_sender.dart';

ElevatedButton(
    onPressed: () async {
        await requestSmsPermission();
        await SmsSender.sendSms(numbers: ['9876543210', '9123456789'], message: 'Hii...!!');
    },
    child: const Text(" SEND SMS"),
)

```

---

## 📱 Platform-specific Setup

### Android

1. **Permissions**

Add this to your `android/app/src/main/AndroidManifest.xml`:

```xml
<uses-permission android:name="android.permission.SEND_SMS"/>
```

2. **Runtime Permissions**

You must request SMS permission at runtime (Android 6.0+). Use [`permission_handler`](https://pub.dev/packages/permission_handler):

```dart
import 'package:permission_handler/permission_handler.dart';

await Permission.sms.request();
```

3. **Real Device Required**

SMS functionality must be tested on a real device, not an emulator.

---

### iOS

1. **Info.plist Setup**

Add this to your `ios/Runner/Info.plist`:

```xml
<key>NSContactsUsageDescription</key>
<string>This app uses contacts to send SMS.</string>
```

2. **Note:**

On iOS, the plugin opens the default SMS composer. The user must manually press **Send** — direct sending is not allowed on iOS due to platform restrictions.

---

## 💡 Notes

- On Android, SMS is sent in the background using `SmsManager`.
- On iOS, the native composer UI is presented and must be submitted by the user.
- Always ensure permissions are granted before sending SMS.

---

## 📌 Supported Platforms

| Platform | Supported |
|----------|-----------|
| Android  | ✅         |
| iOS      | ✅         |

---

## 📄 License

MIT License. See [LICENSE](https://github.com/Pradipjadav05/sms_sender.git/LICENSE) for details.

---

## 🙌 Contributions

Contributions are welcome! Feel free to open issues or pull requests.

---

## 🔗 Author

Developed by [Pradip Jadav](https://github.com/Pradipjadav05/)
