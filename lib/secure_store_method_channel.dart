import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'secure_store_platform_interface.dart';

/// An implementation of [SecureStorePlatform] that uses method channels.
class MethodChannelSecureStore extends SecureStorePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('secure_store');

  SecureStorePlatform get secureStorePlatform =>
      SecureStorePlatform.instance;


  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<void> write(String key, String value) => secureStorePlatform.write(key, value);

  @override
  Future<String> read(String key) => secureStorePlatform.read(key);

  @override
  Future<void> contains( String key) => secureStorePlatform.contains(key);

  @override
  Future<void> delete(String key) => secureStorePlatform.delete(key);

}
