import 'package:todo/data/secure_storage.dart';
import 'package:todo/services/spotify_auth.dart';

class SessionManager {
  static String? accessToken;
  static String? refreshToken;
  static Map<String, dynamic>? userData;

  static bool get isLoggedIn => accessToken != null && userData != null;

  // Load from secure storage on startup or screen init
  static Future<void> load() async {
    final stored = await SecureStorage.loadTokens();
    accessToken = stored['accessToken'];
    refreshToken = stored['refreshToken'];

    if (accessToken != null) {
      try {
        userData = await fetchSpotifyUser(accessToken!);
      } catch (_) {
        // token expired or invalid → clear and force login
        await clear();
      }
    }
  }

  static Future<void> save({
    required String access,
    required String? refresh,
  }) async {
    accessToken = access;
    refreshToken = refresh;

    await SecureStorage.saveTokens(accessToken: access, refreshToken: refresh);

    try {
      userData = await fetchSpotifyUser(accessToken!);
    } catch (_) {
      userData = null;
    }
  }

  static Future<void> clear() async {
    accessToken = null;
    refreshToken = null;
    userData = null;
    await SecureStorage.clear();
  }
}
