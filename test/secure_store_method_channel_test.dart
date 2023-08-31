import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:secure_store/secure_store_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  SecureStore platform = SecureStore();
  const MethodChannel channel = MethodChannel('secure_store');

  group('secure_store_method_tests', () {
    TestWidgetsFlutterBinding.ensureInitialized();

    handler(MethodCall methodCall) async {
      switch (methodCall.method) {
        case 'read':
          {
            return null;
          }
        case 'write':
          {}
        case 'contains':
          {}
        case 'delete':
          {
            return null;
          }
      }
    }

    // Mainly useful in internal tests of
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, handler);

    tearDown(() {});

    var key = 'testKey';
    var value = 'testValue';

    test('contains', () async {
      var result = await platform.contains(key: key);
      expect(result, true);
    });

    test('read', () async {
      var result = await platform.read(key: 'testKey');
      expect(result, 'testValue');
    });

    test('delete', () async {
      var result = await platform.contains(key: key);
      expect(result, true);
    });

    test('write', () async {
      await platform.write(key: key, value: value);

      var result = await platform.read(key: 'testKey');
      expect(result, 'testValue');
    });
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });
}
