import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'secure_store_platform_interface.dart';

/// An implementation of [SecureStorePlatform] that uses method channels.
class SecureStore extends SecureStorePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('secure_store');

  @override
  Future<void> write({required String key, required String value}) async => {
    methodChannel.invokeMethod('write', {'key': key, 'value':value})};

  @override
  Future<String> read({required String key}) async {
    final dynamic results;
    results = await methodChannel.invokeMethod('read', {'key': key});
    return results.cast<String>() ?? <String>{};
  }

  @override
  Future<bool> contains({required String key}) async  {
    final bool result;
    result = await methodChannel.invokeMethod('contains', {'key': key});
    return result;
  }

  @override
  Future<void> delete({required String key}) async => {
    methodChannel.invokeMethod('delete', {'key': key})};
}