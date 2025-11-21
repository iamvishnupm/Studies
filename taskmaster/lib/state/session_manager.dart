import "package:taskmaster/data/secure_storage.dart";
import "package:taskmaster/utils/functions.dart";

class SessionManager {
  static String? accessToken;
  static String? refreshToken;
  static Map<String, dynamic>? userData;

  static bool get isLoggedIn => accessToken != null;

  static Future<void> load() async {
    final stored = await SecureStorage.loadTokens();
    accessToken = stored["accessToken"];
    refreshToken = stored["refreshToken"];
  }

  static Future<void> save({
    required String access,
    required String? refresh,
  }) async {
    accessToken = access;
    refreshToken = refresh;
    await SecureStorage.saveTokens(accessToken: access, refreshToken: refresh);

    try {
      userData = await fetchSpotifyUser(access);
      print("**********************************************");
      print("access : $accessToken");
      print("refresh : $refreshToken");
      print("$userData");
      print("**********************************************");
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
