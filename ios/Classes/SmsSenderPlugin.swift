import Flutter
import UIKit
import MessageUI

public class SmsSenderPlugin: NSObject, FlutterPlugin, MFMessageComposeViewControllerDelegate  {
  var result: FlutterResult?

  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "sms_sender", binaryMessenger: registrar.messenger())
    let instance = SmsSenderPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
      if call.method == "sendSms" {
          guard let args = call.arguments as? [String: Any],
                let numbers = args["numbers"] as? [String],
                let message = args["message"] as? String else {
            result(FlutterError(code: "INVALID_ARGUMENTS", message: "Missing arguments", details: nil))
            return
          }

        self.result = result
        sendSMS(numbers: numbers, message: message)
      } else {
        result(FlutterMethodNotImplemented)
      }
  }

  private func sendSMS(numbers: [String], message: String) {
      if MFMessageComposeViewController.canSendText() {
        let composeVC = MFMessageComposeViewController()
        composeVC.messageComposeDelegate = self
        composeVC.recipients = numbers
        composeVC.body = message

        if let rootVC = UIApplication.shared.delegate?.window??.rootViewController {
          rootVC.present(composeVC, animated: true, completion: nil)
        }
      } else {
        result?(FlutterError(code: "SMS_UNAVAILABLE", message: "Cannot send SMS from this device", details: nil))
      }
    }

public func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith resultCode: MessageComposeResult) {
    controller.dismiss(animated: true) {
      switch resultCode {
      case .sent:
        self.result?("SMS sent.")
      case .cancelled:
        self.result?("SMS cancelled.")
      case .failed:
        self.result?(FlutterError(code: "SMS_FAILED", message: "Failed to send SMS", details: nil))
      @unknown default:
        self.result?(FlutterError(code: "UNKNOWN", message: "Unknown result", details: nil))
      }
    }
  }
}
