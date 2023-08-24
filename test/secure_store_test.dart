import 'package:flutter_test/flutter_test.dart';
import 'package:secure_store/secure_store_platform_interface.dart';
import 'package:secure_store/secure_store_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockSecureStorePlatform
    with MockPlatformInterfaceMixin
    implements SecureStorePlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');

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

void main() {
  final SecureStorePlatform initialPlatform = SecureStorePlatform.instance;

  test('$SecureStore is the default instance', () {
    expect(initialPlatform, isInstanceOf<SecureStore>());
  });

  /*test('getPlatformVersion', () async {
    SecureStore secureStorePlugin = SecureStore();
    MockSecureStorePlatform fakePlatform = MockSecureStorePlatform();
    SecureStorePlatform.instance = fakePlatform;

    expect(await secureStorePlugin.getPlatformVersion(), '42');
  });*/
}
