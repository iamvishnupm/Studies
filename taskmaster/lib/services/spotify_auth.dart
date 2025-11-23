import "dart:math";
import "dart:convert";
import "package:crypto/crypto.dart";
import "package:http/http.dart" as http;
import "package:flutter_web_auth_2/flutter_web_auth_2.dart";
import "package:taskmaster/state/session_manager.dart";

class SpotifyAuth {
  final String clientId = "df3804485412425daa68014cd30ac2ad";
  final String redirectUri = "taskmaster://callback";
  final String scopes =
      "playlist-read-private "
      "playlist-read-collaborative "
      "user-read-playback-state "
      "user-modify-playback-state "
      "streaming "
      "user-top-read "
      "user-read-recently-played "
      "user-library-read";

  String _generateRandomString(int length) {
    const chars =
        "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-._~";
    final rand = Random.secure();
    return List.generate(
      length,
      (_) => chars[rand.nextInt(chars.length)],
    ).join();
  }

  String _base64UrlNoPadding(List<int> bytes) {
    return base64Url.encode(bytes).replaceAll("=", '');
  }

  Future<Map<String, dynamic>> _exchangeCodeForToken(
    String code,
    String codeVerifier,
  ) async {
    //

    final resp = await http.post(
      Uri.parse('https://accounts.spotify.com/api/token'), // URL
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: {
        'grant_type': 'authorization_code',
        'code': code,
        'client_id': clientId,
        'code_verifier': codeVerifier,
        'redirect_uri': redirectUri,
      },
    );

    if (resp.statusCode != 200) {
      throw Exception('Token exchange failed: ${resp.statusCode} ${resp.body}');
    }

    return json.decode(resp.body) as Map<String, dynamic>;
  }

  Future<void> signIn() async {
    //

    final codeVerifier = _generateRandomString(128);
    final codeChallenge = _base64UrlNoPadding(
      sha256.convert(utf8.encode(codeVerifier)).bytes,
    );

    final authUrl = Uri.http("accounts.spotify.com", "/authorize", {
      'response_type': 'code',
      'client_id': clientId,
      'redirect_uri': redirectUri,
      'scope': scopes,
      'code_challenge': codeChallenge,
      'code_challenge_method': 'S256',
    }).toString();

    final authResult = await FlutterWebAuth2.authenticate(
      url: authUrl,
      callbackUrlScheme: "taskmaster",
    );

    final returnedUri = Uri.parse(authResult);

    // ========================================

    final authCode = returnedUri.queryParameters["code"];
    if (authCode == null) throw Exception("No code returned by spotify");

    // ========================================

    final tokenResponse = await _exchangeCodeForToken(authCode, codeVerifier);

    final accessToken = tokenResponse["access_token"] as String;
    final refreshToken = tokenResponse["refresh_token"] as String?;

    await SessionManager.save(access: accessToken, refresh: refreshToken);
  }
}
