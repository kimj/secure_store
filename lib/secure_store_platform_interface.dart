import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'secure_store_method_channel.dart';

abstract class SecureStorePlatform extends PlatformInterface {
  /// Constructs a SecureStorePlatform.
  SecureStorePlatform() : super(token: _token);

  static final Object _token = Object();

  static SecureStorePlatform _instance = MethodChannelSecureStore();

  /// The default instance of [SecureStorePlatform] to use.
  ///
  /// Defaults to [MethodChannelSecureStore].
  static SecureStorePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [SecureStorePlatform] when
  /// they register themselves.
  static set instance(SecureStorePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<void> write(String key, String value);
  Future<String> read(String key);
  Future<void> contains(String key);
  Future<void> delete(String key);
}