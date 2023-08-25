import Flutter
import UIKit

public class SecureStorePlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "secure_store", binaryMessenger: registrar.messenger())
    let instance = SecureStorePlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "read":
      result("iOS " + UIDevice.current.systemVersion)
    case "write":
      let status = SecItemAdd(query as CFDictionary, nil)
      guard status == errSecSuccess else { throw KeychainError.unhandledError(status: status) }

    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
