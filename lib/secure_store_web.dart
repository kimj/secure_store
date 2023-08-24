// In order to *not* need this ignore, consider extracting the "web" version
// of your plugin as a separate package, instead of inlining it in the same
// package as the core of your plugin.
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html show window;

import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'secure_store_platform_interface.dart';

/// A web implementation of the SecureStorePlatform of the SecureStore plugin.
class SecureStoreWeb extends SecureStorePlatform {
  /// Constructs a SecureStoreWeb
  SecureStoreWeb();

  static void registerWith(Registrar registrar) {
    SecureStorePlatform.instance = SecureStoreWeb();
  }

  /// Returns a [String] containing the version of the platform.
  @override
  Future<String?> getPlatformVersion() async {
    final version = html.window.navigator.userAgent;
    return version;
  }

  @override
  Future<void> contains({required String key}) {
    // TODO: implement contains
    throw UnimplementedError();
  }

  @override
  Future<void> delete({required String key}) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<String> read({required String key}) {
    // TODO: implement read
    throw UnimplementedError();
  }

  @override
  Future<void> write({required String key, required String value}) {
    // TODO: implement write
    throw UnimplementedError();
  }
}
