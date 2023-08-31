import 'package:flutter_test/flutter_test.dart';
import 'package:secure_store/secure_store_method_channel.dart';
import 'package:secure_store/secure_store_platform_interface.dart';

void main() {
  final SecureStorePlatform initialPlatform = SecureStorePlatform.instance;

  setUpAll(() => {});

  test('multiple operations ', () async {
    SecureStore secureStorePlugin = SecureStore();

    await secureStorePlugin.write(key: 'testKey', value: 'testValue');
    await secureStorePlugin.write(key: 'testKey1', value: 'testValue1');

    expect(await secureStorePlugin.read(key: 'testKey1'), 'testValue1');
    expect(await secureStorePlugin.contains(key: 'testKey'), true);
  });
}