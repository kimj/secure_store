
import 'secure_store_platform_interface.dart';

class SecureStore {




  Future<String?> getPlatformVersion() {
    return SecureStorePlatform.instance.getPlatformVersion();
  }
}
