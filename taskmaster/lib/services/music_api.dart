import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:taskmaster/state/session_manager.dart';

class MusicApi {
  final String? accessToken = SessionManager.accessToken;

  //---------------------------------------------------------------------------
  // CORE REQUEST
  //---------------------------------------------------------------------------
  Future<Map<String, dynamic>> _get(String url) async {
    if (accessToken == null) throw Exception("No access token");

    final res = await http.get(
      Uri.parse(url),
      headers: {"Authorization": "Bearer $accessToken"},
    );

    // if (res.statusCode == 401) {
    //   // Token expired → refresh
    //   await session.refreshTokens();
    //   return _get(url);
    // }

    if (res.statusCode != 200) {
      throw Exception("Spotify API error: ${res.statusCode} ${res.body}");
    }

    return jsonDecode(res.body);
  }

  //---------------------------------------------------------------------------
  // TOP TRACKS (used for Top 3)
  //---------------------------------------------------------------------------
  Future<List<dynamic>> getTopTracks() async {
    final data = await _get(
      "https://api.spotify.com/v1/me/top/tracks?limit=20",
    );
    return data["items"] ?? [];
  }

  //---------------------------------------------------------------------------
  // RECENTLY PLAYED (fallback if top tracks empty)
  //---------------------------------------------------------------------------
  Future<List<dynamic>> getRecentlyPlayed() async {
    final data = await _get(
      "https://api.spotify.com/v1/me/player/recently-played?limit=20",
    );
    return data["items"] ?? [];
  }

  //---------------------------------------------------------------------------
  // USER PLAYLISTS
  //---------------------------------------------------------------------------
  Future<List<dynamic>> getPlaylists() async {
    final data = await _get("https://api.spotify.com/v1/me/playlists?limit=50");
    return data["items"] ?? [];
  }

  //---------------------------------------------------------------------------
  // TRACKS INSIDE A PLAYLIST
  //---------------------------------------------------------------------------
  Future<List<dynamic>> getPlaylistTracks(String playlistId) async {
    final data = await _get(
      "https://api.spotify.com/v1/playlists/$playlistId/tracks?limit=100",
    );
    return data["items"] ?? [];
  }

  //---------------------------------------------------------------------------
  // SEARCH TRACKS
  //---------------------------------------------------------------------------
  Future<List<dynamic>> searchTracks(String query) async {
    final q = Uri.encodeQueryComponent(query);
    final data = await _get(
      "https://api.spotify.com/v1/search?q=$q&type=track&limit=20",
    );
    return data["tracks"]["items"] ?? [];
  }
}
