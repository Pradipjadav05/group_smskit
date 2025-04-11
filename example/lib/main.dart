import 'package:flutter/material.dart';

// Import the SMS sender plugin
import 'package:flutter_sms_plus/flutter_sms_plus.dart';

// Import permission handler for requesting SMS permission on Android
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(const MyApp()); // Run the main app widget
}

// Root widget of the application
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SmsSenderScreen(),
    );
  }
}

class SmsSenderScreen extends StatefulWidget {
  const SmsSenderScreen({super.key});

  @override
  State<SmsSenderScreen> createState() => _SmsSenderScreenState();
}

class _SmsSenderScreenState extends State<SmsSenderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SMS Sender App')),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            // Request permission before sending SMS
            await requestSmsPermission();

            // Call the plugin method to send SMS
            final result = await FlutterSMSPlus.sendSms(
              // List of recipient numbers
              numbers: ['9876543210', '9123456789'],
              // Message body
              message: 'Hii...!!',
            );

            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(result ?? 'Message sent.')),
              );
            }
          },
          child: const Text("SEND SMS"),
        ),
      ),
    );
  }

  // Function to request SMS permission on Android
  Future<void> requestSmsPermission() async {
    // Check current permission status
    var status = await Permission.sms.status;

    // If not granted, request permission from user
    if (!status.isGranted) {
      await Permission.sms.request();
    }
  }
}
