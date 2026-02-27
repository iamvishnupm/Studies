import "package:flutter_secure_storage/flutter_secure_storage.dart";

class SecureStorage {
  static const _storage = FlutterSecureStorage();

  static Future<void> saveTokens({
    required String accessToken,
    required String? refreshToken,
  }) async {
    await _storage.write(key: 'accessToken', value: accessToken);
    if (refreshToken != null) {
      await _storage.write(key: 'refreshToken', value: refreshToken);
    }
  }

  static Future<Map<String, String?>> loadTokens() async {
    final accessToken = await _storage.read(key: 'accessToken');
    final refreshToken = await _storage.read(key: 'refreshToken');

    return {
      //
      'accessToken': accessToken,
      'refreshToken': refreshToken,
    };
  }

  static Future<void> clear() async {
    await _storage.deleteAll();
  }
}
