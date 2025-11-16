// ignore_for_file: avoid_print

import "package:flutter_web_auth/flutter_web_auth.dart";
import "dart:convert";
import "dart:math";
import "package:crypto/crypto.dart";
import "package:http/http.dart" as http;

// =====================================================

class SpotifyAuth {
  final String clientId = "df3804485412425daa68014cd30ac2ad";
  final String redirectUri = "taskmaster://callback";
  final String scopes =
      "playlist-read-private playlist-read-collaborative user-read-playback-state user-modify-playback-state streaming";

  // =====================================================

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

  Future<Map<String, dynamic>> _fetchSpotifyUser(String accessToken) async {
    final url = Uri.parse('https://api.spotify.com/v1/me');

    final resp = await http.get(
      url,
      headers: {'Authorization': 'Bearer $accessToken'},
    );

    if (resp.statusCode != 200) {
      throw Exception(
        'Failed to load profile: ${resp.statusCode} ${resp.body}',
      );
    }

    return json.decode(resp.body) as Map<String, dynamic>;
  }

  // =====================================================

  Future signIn() async {
    final codeVerifier = _generateRandomString(128);
    final codeChallenge = _base64UrlNoPadding(
      sha256.convert(utf8.encode(codeVerifier)).bytes,
    );

    // authUrl made
    final authUrl = Uri.https("accounts.spotify.com", "/authorize", {
      'response_type': 'code',
      'client_id': clientId,
      'scope': scopes,
      'code_challenge': codeChallenge,
      'code_challenge_method': 'S256',
      'redirect_uri': redirectUri,
    }).toString();

    // send request to spotify & got response - auth_result
    final authResult = await FlutterWebAuth.authenticate(
      url: authUrl,
      callbackUrlScheme: Uri.parse(redirectUri).scheme,
    );

    // from authResult returnedUri taken & authCode is taken from returned Uri
    final returnedUri = Uri.parse(authResult);
    final authCode = returnedUri.queryParameters['code'];
    if (authCode == null) throw Exception("No code returned by spotify");

    // =========================================

    // tokenResponse contains access_token, refresh_token, expires_in
    final tokenResponse = await _exchangeCodeForToken(authCode, codeVerifier);

    // got accessToken from tokenResponse
    final accessToken = tokenResponse['access_token'] as String;

    // fetching user data to know everything worked well
    final user = await _fetchSpotifyUser(accessToken);

    // end for now.
    print("User Data => Name : ${user['display_name']}");
    print("=================================================");
    print(user);
  }
}
