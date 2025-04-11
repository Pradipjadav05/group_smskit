import 'package:flutter/material.dart';

// Import the SMS sender plugin
import 'package:sms_sender/sms_sender.dart';

// Import permission handler for requesting SMS permission on Android
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(const MyApp()); // Run the main app widget
}

// Root widget of the application
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

// The stateful widget that manages app state
class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    // You could initialize things here if needed
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('SMS Sender App'), // App bar title
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () async {
              // Request permission before sending SMS
              await requestSmsPermission();

              // Call the plugin method to send SMS
              await SmsSender.sendSms(
                // List of recipient numbers
                numbers: ['9876543210', '9123456789'],
                // Message body
                message: 'Hii...!!',
              );
            },
            child: const Text("SEND SMS"),
          ),
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
